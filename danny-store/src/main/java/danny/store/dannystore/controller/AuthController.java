package danny.store.dannystore.controller;

import danny.store.dannystore.domain.model.UserInput;
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
    @GetMapping("/test")
    public ResponseEntity<?> test() {
        return new ResponseEntity<>("Test authentication", HttpStatus.OK);
    }
}