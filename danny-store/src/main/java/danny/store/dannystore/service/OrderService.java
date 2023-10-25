package danny.store.dannystore.service;
import com.fasterxml.jackson.databind.ObjectMapper;
import danny.store.dannystore.domain.dto.OrderDetailDto;
import danny.store.dannystore.domain.dto.OrderDto;
import danny.store.dannystore.domain.dto.OrderItemDto;
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
import java.util.stream.Collectors;

import static danny.store.dannystore.common.Const.*;

@Service
@RequiredArgsConstructor
public class OrderService {
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final OrderItemRepository orderItemRepository;
    private final OrderRepository orderRepository;
    private final StatusOrderRepository statusOrderRepository;
    @Autowired
    private PublicFunction publicFunction;
    @Autowired
    private ObjectMapper objectMapper;
    @Transactional(rollbackOn = Exception.class)
    public String createOrderFromCart(Long userId) throws NotFoundException {
        Order order = new Order();
        Float countTotalAmount = 0F;
        List<Cart> cartList = cartRepository.findByUserId(userId);
        if (!cartList.isEmpty() && cartList != null) {
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
                countTotalAmount += cartDetail.getPrice() * cartDetail.getQuantity();
            }
            order.setCreatedAt(new Date());
            order.setTotalAmount(countTotalAmount);
            orderRepository.save(order);
            System.out.println(RESPONSE_ADD_ORDER_SUCCESS);
            return RESPONSE_ADD_ORDER_SUCCESS;
        } else {
            System.out.println(RESPONSE_LIST_CARTS_NULL);
            throw new NotFoundException(RESPONSE_LIST_CARTS_NULL);
        }
    }

    public List<OrderDto> getAllOrders(Long userId) throws NotFoundException {
        List<OrderDto> orderDtoList = new ArrayList<>();
        List<Order> orderList = orderRepository.findByUserId(userId);
        for (Order order: orderList) {
            OrderDto orderDto = objectMapper.convertValue(order, OrderDto.class);
            orderDto.setCreatedAt(publicFunction.formatTime(order.getCreatedAt()));
            orderDto.setStatus(getStatusOrder(order.getStatusId()));
            orderDtoList.add(orderDto);
        }
        System.out.println(RESPONSE_LIST_ORDERS);
        return orderDtoList;
    }
    private String getStatusOrder(Long statusId) throws NotFoundException {
        Optional<StatusOrder> statusOrderOptional = statusOrderRepository.findById(statusId);
        if (statusOrderOptional.isPresent()) {
            return statusOrderOptional.get().getStatusName();
        } else {
            throw new NotFoundException(RESPONSE_NOT_FOUND);
        }
    }
    public OrderDetailDto getOrderDetail(Long userId, Long orderId) throws NotFoundException {
        Optional<Order> orderOptional = orderRepository.findById(orderId);
        if (orderOptional.isPresent()) {
            List<OrderItem> orderItemList = orderItemRepository.findByOrderId(orderId);
            List<OrderItemDto> orderItemDtoList = orderItemList.stream().map(orderItem -> {
                OrderItemDto orderItemDto = new OrderItemDto();
                orderItemDto.setId(orderItem.getId());
                orderItemDto.setOrderId(orderItem.getOrderId());
                orderItemDto.setProductId(orderItem.getProductId());
                orderItemDto.setPrice(orderItem.getPrice());
                orderItemDto.setQuantity(orderItem.getQuantity());
                orderItemDto.setCreatedAt(publicFunction.formatTime(orderItem.getCreatedAt()));
                return orderItemDto;
            }).collect(Collectors.toList());
            OrderDetailDto orderDetailDto = new OrderDetailDto();
            orderDetailDto.setOrderItemList(orderItemDtoList);
            orderDetailDto.setOrderId(orderId);
            orderDetailDto.setUserId(userId);
            orderDetailDto.setCreatedAt(publicFunction.formatTime(orderOptional.get().getCreatedAt()));
            System.out.println(RESPONSE_LIST_ORDER_DETAIL);
            return orderDetailDto;
        } else {
            System.out.println(RESPONSE_NOT_FOUND_ORDER);
            throw new NotFoundException(RESPONSE_NOT_FOUND_ORDER);
        }
    }
}
