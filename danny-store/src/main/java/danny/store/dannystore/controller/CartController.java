package danny.store.dannystore.controller;

import danny.store.dannystore.domain.dto.CartDto;
import danny.store.dannystore.domain.dto.CartDtoAndAmount;
import danny.store.dannystore.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;
    @GetMapping
    public CartDtoAndAmount getListCart(@RequestParam Long userId) {
        return cartService.getListCart(1L);
    }
}
