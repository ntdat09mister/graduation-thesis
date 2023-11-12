package danny.store.dannystore.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import danny.store.dannystore.common.RoleType;
import danny.store.dannystore.common.StatusType;
import danny.store.dannystore.domain.dto.UserAdminDto;
import danny.store.dannystore.domain.entity.Role;
import danny.store.dannystore.domain.entity.User;
import danny.store.dannystore.domain.model.UserInput;
import danny.store.dannystore.domain.model.UserOutput;
import danny.store.dannystore.repository.OrderRepository;
import danny.store.dannystore.repository.RoleRepository;
import danny.store.dannystore.repository.UserRepository;
import javassist.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import static danny.store.dannystore.common.Const.RESPONSE_NOT_FOUND;
import static danny.store.dannystore.common.Const.RESPONSE_NOT_FOUND_USER;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    @Autowired
    private ObjectMapper objectMapper;
    @Autowired
    private PublicFunction publicFunction;
    private final OrderRepository orderRepository;
    private final PasswordEncoder passwordEncoder;
    private final RoleRepository roleRepository;
    public String register(UserInput userInput) throws NotFoundException {
        if (existsByUsername(userInput.getUsername()))
            throw new NotFoundException("Username already exist!");
        User user = objectMapper.convertValue(userInput, User.class);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(RoleType.CUSTOMER);
        user.setActive(StatusType.ACTIVE);
        user.setCreatedAt(new Date());
        userRepository.save(user);
        return "Created success account with username: " + userInput.getUsername();
    }
    public boolean existsByUsername(String username) {
        return userRepository.existsByUsername(username);
    }

    public User findByUserName(String userName) throws NotFoundException {
        Optional<User> userOptional = userRepository.findByUsername(userName);
        if (userOptional.isPresent()) {
            User user = userOptional.get();
            return user;
        } else {
            throw new NotFoundException(RESPONSE_NOT_FOUND_USER);
        }
    }

    public UserOutput findByUserId(Long id) throws NotFoundException {
        Optional<User> userOptional = userRepository.findById(id);
        Long totalOrders = orderRepository.countOrders(id);
        Long totalAmount = orderRepository.getTotalAmount(id);
        if (userOptional.isPresent()) {
            UserOutput userOutput = objectMapper.convertValue(userOptional.get(), UserOutput.class);
            userOutput.setCreatedAt(publicFunction.formatTime(userOptional.get().getCreatedAt()));
            userOutput.setQuantityOrders(totalOrders);
            userOutput.setTotalAmount(totalAmount);
            return userOutput;
        } else {
            throw new NotFoundException(RESPONSE_NOT_FOUND_USER);
        }
    }

    public List<UserAdminDto> findAllUsers(Long id) throws NotFoundException {
        Optional<User> userOptional = userRepository.findById(id);
        try {
            if (userOptional.get().getRole().equals("admin")) {
                List<User> userList = userRepository.findAll();
                List<UserAdminDto> userAdminDtoList = new ArrayList<>();
                for ( User user: userList ) {
                    UserAdminDto userAdminDto = objectMapper.convertValue(user, UserAdminDto.class);
                    userAdminDto.setCreatedAt(publicFunction.formatTime(user.getCreatedAt()));
                    userAdminDtoList.add(userAdminDto);
                }
                return userAdminDtoList;
            } else {
                throw new NotFoundException(RESPONSE_NOT_FOUND);
            }
        } catch (Exception e) {
            throw new NotFoundException(RESPONSE_NOT_FOUND_USER);
        }
    }

    public String updateRole(Long id, Long userId, Long roleId) throws NotFoundException {
        Optional<User> userOptional = userRepository.findById(id);
        Optional<Role> roleOptional = roleRepository.findById(roleId);
        if (userOptional.get().getRole().equals("admin") && roleOptional.isPresent()) {
            Optional<User> optionalUser = userRepository.findById(userId);
            if (optionalUser.isPresent()) {
                User user = optionalUser.get();
                user.setRole(roleOptional.get().getRoleName());
                userRepository.save(user);
                return "Update success user" + userOptional.get().getUsername() + " to " + roleOptional.get().getRoleName();
            } else {
                throw new NotFoundException(RESPONSE_NOT_FOUND_USER);
            }
        } else {
            throw new NotFoundException(RESPONSE_NOT_FOUND_USER);
        }
    }

    public String deleteUser(Long id, Long userId) throws NotFoundException {
        Optional<User> userOptional = userRepository.findById(id);
        if (userOptional.get().getRole().equals("admin")) {
            Optional<User> optionalUser = userRepository.findById(userId);
            if (optionalUser.isPresent()) {
                userRepository.deleteById(userId);
                return "Delete success user" + userOptional.get().getUsername();
            } else {
                throw new NotFoundException(RESPONSE_NOT_FOUND_USER);
            }
        } else {
            throw new NotFoundException(RESPONSE_NOT_FOUND_USER);
        }
    }
}
