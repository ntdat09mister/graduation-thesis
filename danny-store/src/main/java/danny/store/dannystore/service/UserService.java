package danny.store.dannystore.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import danny.store.dannystore.common.RoleType;
import danny.store.dannystore.common.StatusType;
import danny.store.dannystore.domain.dto.ChangePasswordDto;
import danny.store.dannystore.domain.dto.InforUserUpdateDto;
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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.common.exceptions.UnauthorizedClientException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import static danny.store.dannystore.common.Const.*;

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
    public ResponseEntity register(UserInput userInput) throws NotFoundException {
        if (existsByUsername(userInput.getUsername()))
            throw new NotFoundException("Username already exist!");
        User user = objectMapper.convertValue(userInput, User.class);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(RoleType.CUSTOMER);
        user.setActive(StatusType.ACTIVE);
        user.setCreatedAt(new Date());
        user.setGender(userInput.getGender());
        userRepository.save(user);
        return new ResponseEntity<>(HttpStatus.CREATED);
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
        Long totalOrdersSuccess = orderRepository.countOrdersSuccess(id);
        Long totalAmount = orderRepository.getTotalAmount(id);
        if (userOptional.isPresent()) {
            UserOutput userOutput = objectMapper.convertValue(userOptional.get(), UserOutput.class);
            userOutput.setCreatedAt(publicFunction.formatTime(userOptional.get().getCreatedAt()));
            userOutput.setQuantityOrders(totalOrders);
            userOutput.setTotalAmount(totalAmount);
            userOutput.setQuantityOrdersSuccess(totalOrdersSuccess);
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

    public String updateUserAdmin(Long id, UserAdminDto userAdminDto) throws NotFoundException {
        Optional<User> userOptional = userRepository.findById(id);
        Optional<User> optionalUserUpdate = userRepository.findById(userAdminDto.getId());
        Optional<Role> roleOptional = roleRepository.findByRoleName(userAdminDto.getRole());
        if (userOptional.get().getRole().equals("admin") && roleOptional.isPresent() && optionalUserUpdate.isPresent()) {
            User user = optionalUserUpdate.get();
            user.setUsername(userAdminDto.getUsername());
            user.setName(userAdminDto.getName());
            user.setGender(userAdminDto.getGender());
            user.setAddress(userAdminDto.getAddress());
            user.setPhone(userAdminDto.getPhone());
            user.setRole(roleOptional.get().getRoleName());
            user.setCreatedAt(new Date());
            userRepository.save(user);
            return "Update success user" + optionalUserUpdate.get().getUsername();
        } else {
            throw new NotFoundException(RESPONSE_NOT_FOUND_USER);
        }
    }
    public String updateUser(Long id, InforUserUpdateDto inforUserUpdateDto) throws NotFoundException {
        Optional<User> userOptional = userRepository.findById(id);
        Optional<User> optionalUserUpdate = userRepository.findById(inforUserUpdateDto.getUserId());
        if (userOptional.isPresent() && optionalUserUpdate.isPresent()) {
            User user = optionalUserUpdate.get();
            user.setAddress(inforUserUpdateDto.getAddress());
            user.setPhone(inforUserUpdateDto.getPhone());
            user.setCreatedAt(new Date());
            userRepository.save(user);
            return "Update success user" + optionalUserUpdate.get().getUsername();
        } else {
            throw new NotFoundException(RESPONSE_NOT_FOUND_USER);
        }
    }
    public String changePassword(Long userId, ChangePasswordDto input) throws Exception {
        // check for user
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new Exception("Not found any user with id: " + userId));
        // check for old password
        if (!passwordEncoder.matches(input.getOldPassword(), user.getPassword()))
            throw new Exception("Wrong username or password!");
        if (input.getNewPassword().equals(input.getRetypeNewPassword())) {
            user.setPassword(passwordEncoder.encode(input.getNewPassword()));
            userRepository.save(user);
            return "Đổi mật khẩu thành công";
        } else {
            return "Mật khẩu mới không khớp";
        }
    }
}
