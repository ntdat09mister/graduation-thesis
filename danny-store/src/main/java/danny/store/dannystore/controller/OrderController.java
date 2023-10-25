package danny.store.dannystore.controller;
import danny.store.dannystore.domain.entity.User;
import danny.store.dannystore.resolver.UserInfo;
import danny.store.dannystore.service.CartService;
import danny.store.dannystore.service.OrderService;
import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/order")
public class OrderController extends BaseController{
    @Autowired
    private OrderService orderService;
    @Autowired
    private CartService cartService;
    @PostMapping("/add")
    public ResponseEntity<?> createOrderFromCart(@UserInfo User user) {
        return successResponseCreated(orderService.createOrderFromCart(user.getId()), null, HttpStatus.CREATED);
    }
    @GetMapping("/all")
    public ResponseEntity<?> getAllOrders(@UserInfo User user) {
        return successResponse(orderService.getAllOrders(user.getId()));
    }
    @GetMapping("/detail")
    public ResponseEntity<?> getOrderDetail(@UserInfo User user, @RequestParam Long orderId) throws NotFoundException {
        return successResponse(orderService.getOrderDetail(user.getId(), orderId));
    }

}
