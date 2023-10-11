package danny.store.dannystore.controller;

import danny.store.dannystore.domain.entity.User;
import danny.store.dannystore.resolver.UserInfo;
import danny.store.dannystore.resolver.UserInfoArgumentResolver;
import danny.store.dannystore.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
