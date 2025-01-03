package danny.store.dannystore.controller;

import danny.store.dannystore.domain.entity.User;
import danny.store.dannystore.domain.model.CartInput;
import danny.store.dannystore.resolver.UserInfo;
import danny.store.dannystore.resolver.UserInfoArgumentResolver;
import danny.store.dannystore.service.CartService;
import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/cart")
public class CartController extends BaseController{
    @Autowired
    private UserInfoArgumentResolver userInfoArgumentResolver;
    @Autowired
    private CartService cartService;
    @GetMapping("/all")
    public ResponseEntity<?> findAllCarts(@UserInfo User user) {
        return successResponse(cartService.getListCartsUser(user.getId()));
    }
    @PostMapping("/add")
    public ResponseEntity<?> addToCart(@UserInfo User user, @RequestBody CartInput cartInput) throws NotFoundException {
        return successResponseCreated(cartService.addToCart(user.getId(), cartInput), null, HttpStatus.CREATED);
    }

    @DeleteMapping("/delete")
    public ResponseEntity<?> deleteCartWithId(@UserInfo User user,@RequestParam Long cartId) throws NotFoundException {
        return successResponse(cartService.deleteCartWithId(user.getId(), cartId));
    }
    @PutMapping("/updateQuantity")
    public ResponseEntity<?> updateCartQuantity(@UserInfo User user, @RequestParam Boolean statusUpdate, @RequestParam Long cartId) {
        return successResponse(cartService.updateCartQuantity(user.getId(), statusUpdate, cartId));
    }

    @PreAuthorize("hasAnyAuthority('admin')")
    @GetMapping("/admin")
    public String testAuthAdmin() {
        return "admin";
    }
    @PreAuthorize("hasAnyAuthority('warehouse','admin')")
    @GetMapping("/warehouse")
    public String testAuthWareHouse() {
        return "warehouse";
    }
    @PreAuthorize("hasAnyAuthority('sales','admin')")
    @GetMapping("/sales")
    public String testAuthSales() {
        return "sales";
    }
    @PreAuthorize("hasAnyAuthority('customer')")
    @GetMapping("/customer")
    public String testAuthCustomer() {
        return "customer";
    }
}
