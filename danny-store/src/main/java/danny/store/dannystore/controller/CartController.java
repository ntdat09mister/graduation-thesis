package danny.store.dannystore.controller;

import danny.store.dannystore.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/cart")
public class CartController extends BaseController{
    @Autowired
    private CartService cartService;
    @GetMapping
    public ResponseEntity<?> getListCart(@RequestParam Long userId) {
        return successResponse(cartService.getListCart(1L));
    }
}
