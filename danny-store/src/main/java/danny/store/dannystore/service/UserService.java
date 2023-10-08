package danny.store.dannystore.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import danny.store.dannystore.common.RoleType;
import danny.store.dannystore.common.StatusType;
import danny.store.dannystore.domain.entity.User;
import danny.store.dannystore.domain.model.UserInput;
import danny.store.dannystore.repository.UserRepository;
import javassist.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    @Autowired
    private ObjectMapper objectMapper;
    private final PasswordEncoder passwordEncoder;
    public String register(UserInput userInput) throws NotFoundException {
        if (existsByUsername(userInput.getUsername()))
            throw new NotFoundException("Username already exist!");
        User user = objectMapper.convertValue(userInput, User.class);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(RoleType.USER);
        user.setActive(StatusType.ACTIVE);
        user.setCreatedAt(new Date());
        userRepository.save(user);
        return "Created success account with username: " + userInput.getUsername();
    }
    public boolean existsByUsername(String username) {
        return userRepository.existsByUsername(username);
    }
}
