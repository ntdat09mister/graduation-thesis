package danny.store.dannystore.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import danny.store.dannystore.domain.dto.ChangePasswordDto;
import danny.store.dannystore.domain.entity.User;
import danny.store.dannystore.domain.model.ForgotPasswordInput;
import danny.store.dannystore.domain.model.LoginInput;
import danny.store.dannystore.domain.model.UserInput;
import danny.store.dannystore.resolver.UserInfo;
import danny.store.dannystore.service.UserService;
import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    private UserService userService;
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody UserInput userInput) throws NotFoundException {
        return new ResponseEntity<>(userService.register(userInput),HttpStatus.CREATED);
    }
    @PutMapping("/changePassword")
    public ResponseEntity<?> changePassword(@UserInfo User user, @RequestBody ChangePasswordDto changePasswordDto) throws Exception {
        return new ResponseEntity<>(userService.changePassword(user.getId(), changePasswordDto),HttpStatus.OK);
    }
    @GetMapping("/test")
    public ResponseEntity<?> test() {
        return new ResponseEntity<>("Test authentication", HttpStatus.OK);
    }
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginInput loginInput) throws JsonProcessingException {
        return new ResponseEntity<>(userService.login(loginInput),HttpStatus.OK);
    }
    @PostMapping("/forgotPassword")
    public ResponseEntity<?> forgotPassword(@RequestBody ForgotPasswordInput forgotPasswordInput) throws NotFoundException {
        return new ResponseEntity<>(userService.forgotPassword(forgotPasswordInput),HttpStatus.OK);
    }
}