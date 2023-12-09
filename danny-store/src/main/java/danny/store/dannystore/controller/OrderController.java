package danny.store.dannystore.controller;
import danny.store.dannystore.domain.dto.OrderDtoForAdmin;
import danny.store.dannystore.domain.dto.OrderInstant;
import danny.store.dannystore.domain.dto.PaymentDto;
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
        return successResponse(orderService.createOrderFromCart(user.getId()));
    }
    @PostMapping("/addOrderInstant")
    public ResponseEntity<?> addOrderInstant(@UserInfo User user, @RequestBody OrderInstant orderInstant) {
        return successResponse(orderService.addOrderInstant(user.getId(), orderInstant));
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
    public ResponseEntity<?> updateStatusOrder(@UserInfo User user, @RequestParam Long orderId, @RequestParam Long statusUpdate, @RequestParam Long paymentStatus) throws NotFoundException {
        return successResponse(orderService.updateStatusOrder(user.getId(), orderId, statusUpdate, paymentStatus));
    }
    @PutMapping("/cancelOrder")
    public ResponseEntity<?> cancelOrder(@UserInfo User user, @RequestParam Long orderId) throws NotFoundException {
        return successResponse(orderService.cancelOrder(user.getId(), orderId));
    }
    @PutMapping("/updateReceived")
    public ResponseEntity<?> updateReceived(@UserInfo User user, @RequestParam Long orderId) throws NotFoundException {
        return successResponse(orderService.updateReceived(user.getId(), orderId));
    }
    @PutMapping("/refundOrder")
    public ResponseEntity<?> refundOrder(@UserInfo User user, @RequestParam Long orderId) throws NotFoundException {
        return successResponse(orderService.refundOrder(user.getId(), orderId));
    }
    @PutMapping("/updatePayment")
    public ResponseEntity<?> updatePayment(@UserInfo User user, @RequestBody PaymentDto paymentDto) throws NotFoundException {
        return successResponse(orderService.updatePayment(user.getId(), paymentDto));
    }
}
