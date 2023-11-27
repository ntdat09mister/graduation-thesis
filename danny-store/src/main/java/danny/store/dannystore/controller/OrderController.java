package danny.store.dannystore.controller;
import danny.store.dannystore.domain.dto.OrderDtoForAdmin;
import danny.store.dannystore.domain.entity.User;
import danny.store.dannystore.resolver.UserInfo;
import danny.store.dannystore.service.CartService;
import danny.store.dannystore.service.OrderService;
import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/order")
public class OrderController extends BaseController{
    @Autowired
    private OrderService orderService;
    @PostMapping("/add")
    public ResponseEntity<?> createOrderFromCart(@UserInfo User user) throws NotFoundException {
        return successResponseCreated(orderService.createOrderFromCart(user.getId()), null, HttpStatus.CREATED);
    }
    @GetMapping("/all")
    public ResponseEntity<?> getAllOrders(@UserInfo User user) throws NotFoundException {
        return successResponse(orderService.getAllOrders(user.getId()));
    }
    @GetMapping("/detail")
    public ResponseEntity<?> getOrderDetail(@UserInfo User user, @RequestParam Long orderId) throws NotFoundException {
        return successResponse(orderService.getOrderDetail(user.getId(), orderId));
    }
    @PreAuthorize("hasAnyAuthority('sales','admin')")
    @GetMapping("/admin/all")
    public ResponseEntity<?> getAllOrdersAdmin(@UserInfo User user, @RequestParam (required = false) Long filterId) throws NotFoundException {
        return successResponse(orderService.getAllOrdersAdmin(user.getId(), filterId));
    }
    @PreAuthorize("hasAnyAuthority('sales','admin')")
    @PutMapping("admin/updateStatusOrder")
    public ResponseEntity<?> updateStatusOrder(@UserInfo User user, @RequestParam Long orderId) throws NotFoundException {
        return successResponse(orderService.updateStatusOrder(user.getId(), orderId));
    }
    @PutMapping("/cancelOrder")
    public ResponseEntity<?> cancelOrder(@UserInfo User user, @RequestParam Long orderId) throws NotFoundException {
        return successResponse(orderService.cancelOrder(user.getId(), orderId));
    }
}
