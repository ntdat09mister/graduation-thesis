package danny.store.dannystore.util;

import danny.store.dannystore.domain.entity.User;
import danny.store.dannystore.repository.UserRepository;
import javassist.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class UserSecurity {
    private final UserRepository userRepository;

    /**
     * When user is authenticated, they only can access their own information
     * This function retrieves authentication info in security context and get user principal,
     * then when user request user info at route user/:userId,
     * it checks for whether the user has userId in the route is the user that authenticated.
     * @param authentication Authentication
     * @param userId User id
     * @return true or false
     */
    public boolean hasUserId(Authentication authentication, Long userId) throws NotFoundException {
        Optional<User> userOptional = userRepository.findById(userId);
        if (userOptional.isPresent()) {
            User user = userOptional.get();
            return user.getUsername().equals(authentication.getPrincipal());
        } else {
            throw new NotFoundException("Not found your account!");
        }
    }
}

