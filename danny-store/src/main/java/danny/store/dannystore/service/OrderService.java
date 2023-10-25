package danny.store.dannystore.service;
import danny.store.dannystore.domain.dto.OrderDto;
import danny.store.dannystore.domain.entity.*;
import danny.store.dannystore.repository.*;
import javassist.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import static danny.store.dannystore.common.Const.RESPONSE_ADD_ORDER_SUCCESS;
import static danny.store.dannystore.common.Const.RESPONSE_NOT_FOUND_ORDER;

@Service
@RequiredArgsConstructor
public class OrderService {
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final OrderItemRepository orderItemRepository;
    private final OrderRepository orderRepository;
    @Autowired
    private PublicFunction publicFunction;
    @Transactional(rollbackOn = Exception.class)
    public String createOrderFromCart(Long userId) {
        Order order = new Order();
        List<Cart> cartList = cartRepository.findByUserId(userId);
        order.setUserId(userId);
        order.setStatusId(1L);
        orderRepository.save(order);
        for (Cart cart: cartList) {
            CartDetail cartDetail = cartDetailRepository.findByCartId(cart.getId());
            OrderItem orderItem = new OrderItem();
            orderItem.setOrderId(order.getId());
            orderItem.setProductId(cartDetail.getProductId());
            orderItem.setQuantity(cartDetail.getQuantity());
            orderItem.setPrice(cartDetail.getPrice());
            orderItem.setCreatedAt(new Date());
            orderItemRepository.save(orderItem);
            cartRepository.deleteById(cart.getId());
            cartDetailRepository.deleteById(cart.getId());
        }
        return RESPONSE_ADD_ORDER_SUCCESS;
    }

    public List<Order> getAllOrders(Long userId) {
        List<Order> orderList = orderRepository.findByUserId(userId);
        return orderList;
    }
    public OrderDto getOrderDetail(Long userId, Long orderId) throws NotFoundException {
        Optional<Order> orderOptional = orderRepository.findById(orderId);
        if (orderOptional.isPresent()) {
            List<OrderItem> orderItemList = orderItemRepository.findByOrderId(orderId);
            OrderDto orderDto = new OrderDto();
            orderDto.setOrderItemList(orderItemList);
            orderDto.setOrderId(orderId);
            orderDto.setUserId(userId);
            orderDto.setCreatedAt(publicFunction.formatTime(orderOptional.get().getCreatedAt()));
            return orderDto;
        } else {
            throw new NotFoundException(RESPONSE_NOT_FOUND_ORDER);
        }
    }
}
