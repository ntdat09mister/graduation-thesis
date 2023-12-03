package danny.store.dannystore.service;
import com.fasterxml.jackson.databind.ObjectMapper;
import danny.store.dannystore.domain.dto.*;
import danny.store.dannystore.domain.entity.*;
import danny.store.dannystore.repository.*;
import javassist.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.aspectj.weaver.ast.Or;
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
    private final ProductRepository productRepository;
    private final StatusOrderRepository statusOrderRepository;
    private final UserRepository userRepository;
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
            order.setCustomerId(userId);
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
                cartDetailRepository.deleteByCartId(cart.getId());
                countTotalAmount += cartDetail.getPrice() * cartDetail.getQuantity();
            }
            order.setCreatedAt(new Date());
            order.setTotalAmount(countTotalAmount);
            order.setSaleStaffId(1L);
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
        List<Order> orderList = orderRepository.findByCustomerId(userId);

        for (Order order: orderList) {
            List<OrderItem> orderItemList = new ArrayList<>();
            orderItemList = orderItemRepository.findByOrderId(order.getId());
            StringBuilder productLists = new StringBuilder();
            for (int i = 0; i < orderItemList.size(); i++) {
                OrderItem orderItem = orderItemList.get(i);
                Optional<Product> productOptional = productRepository.findById(orderItem.getProductId());
                productLists.append(productOptional.get().getName());
                if (i < orderItemList.size() - 1) {
                    productLists.append(", ");
                }
            }

            OrderDto orderDto = new OrderDto();
            Optional<Product> productOptional = productRepository.findById(orderItemList.get(0).getProductId());
            orderDto.setSrc(productOptional.get().getSrc());
            orderDto.setId(order.getId());
            orderDto.setTotalAmount(order.getTotalAmount());
            orderDto.setCreatedAt(publicFunction.formatTime(order.getCreatedAt()));
            orderDto.setStatus(getStatusOrder(order.getStatusId()));
            orderDto.setListProducts(productLists.toString());
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
        Optional<Order> orderOptional = orderRepository.findByIdAndCustomerId(orderId, userId);
        Optional<User> userOptional = userRepository.findById(userId);
        if (orderOptional.isPresent()) {
            List<OrderItem> orderItemList = orderItemRepository.findByOrderId(orderId);
            List<OrderItemDto> orderItemDtoList = orderItemList.stream().map(orderItem -> {
                Optional<Product> productOptional = productRepository.findById(orderItem.getProductId());
                OrderItemDto orderItemDto = new OrderItemDto();
                orderItemDto.setOrderId(orderItem.getId());
                orderItemDto.setProductName(productOptional.get().getName());
                orderItemDto.setPrice(orderItem.getPrice());
                orderItemDto.setQuantity(orderItem.getQuantity());
                orderItemDto.setSrcProduct(productOptional.get().getSrc());
                return orderItemDto;
            }).collect(Collectors.toList());
            OrderDetailDto orderDetailDto = new OrderDetailDto();
            orderDetailDto.setOrderItemList(orderItemDtoList);
            orderDetailDto.setOrderId(orderId);
            orderDetailDto.setUserId(userId);
            orderDetailDto.setTotalAmount(orderOptional.get().getTotalAmount());
            orderDetailDto.setCreatedAt(publicFunction.formatTimeDetail(orderOptional.get().getCreatedAt()));
            orderDetailDto.setNameCustomer(userOptional.get().getName());
            orderDetailDto.setAddress(userOptional.get().getAddress());
            orderDetailDto.setPhoneNumber(userOptional.get().getPhone());
            orderDetailDto.setUsername(userOptional.get().getUsername());
            System.out.println(RESPONSE_LIST_ORDER_DETAIL);
            return orderDetailDto;
        } else {
            System.out.println(RESPONSE_NOT_FOUND_ORDER);
            throw new NotFoundException(RESPONSE_NOT_FOUND_ORDER);
        }
    }
    private List<ReportItemDto> mappingReportItemDtos(List<Order> orderList) throws NotFoundException {
        List<ReportItemDto> reportItemDtoList = new ArrayList<>();
        for (Order order: orderList) {
            Optional<User> customerOptional = userRepository.findById(order.getCustomerId());
            Optional<User> saleStaffOptional = userRepository.findById(order.getSaleStaffId());
            ReportItemDto reportItemDto = new ReportItemDto();
            reportItemDto.setOrderId(order.getId());
            if (customerOptional.isPresent()) {
                reportItemDto.setCustomerName(customerOptional.get().getName());
            }
            if (saleStaffOptional.isPresent()) {
                reportItemDto.setSaleStaffName(saleStaffOptional.get().getName());
            }
            reportItemDto.setTotalAmount(order.getTotalAmount());
            reportItemDto.setStatus(publicFunction.getStatus(order.getStatusId()));
            reportItemDto.setCreatedAt(publicFunction.formatTime(order.getCreatedAt()));
            reportItemDtoList.add(reportItemDto);
        }
        return reportItemDtoList;
    }

    private FilterReport getFilterReport(List<Order> orderList, Float totalAmountReport) throws NotFoundException {
        FilterReport filterReport = new FilterReport();
        List<ReportItemDto> reportItemDtoList = new ArrayList<>();
        reportItemDtoList = mappingReportItemDtos(orderList);
        filterReport.setReportDtoList(reportItemDtoList);
        filterReport.setTotalAmount(totalAmountReport);
        filterReport.setTotalOrders(Long.valueOf(orderList.size()));
        Long successOrders = orderList.stream().filter(order -> order.getStatusId() == 4L).count();
        filterReport.setSuccessOrders(successOrders);
        Long receivedOrders = orderList.stream().filter(order -> order.getStatusId() == 1L).count();
        filterReport.setOrdersReceived(receivedOrders);
        return filterReport;
    }

    public FilterReport filterReport(Long byDay, Long byMonth, Long byYear) throws NotFoundException {
        Date dateNow = new Date();
        String filterTime = "";
        Float totalAmountReport = 0F;
        List<Order> orderList = new ArrayList<>();
        List<ReportItemDto> reportItemDtoList = new ArrayList<>();
        if (byDay != null && byMonth == null && byYear == null) {
            filterTime = publicFunction.getYear(dateNow) + "-" + publicFunction.getMonth(dateNow) + "-" + byDay;
            orderList = orderRepository.filterByDay(filterTime);
            totalAmountReport = orderRepository.totalAmountByDay(filterTime);
            return getFilterReport(orderList, totalAmountReport);
        } else if (byDay == null && byMonth !=null && byYear == null) {
            orderList = orderRepository.filterByMonth(publicFunction.getYear(new Date()), byMonth);
            totalAmountReport = orderRepository.totalAmountByMonth(publicFunction.getYear(new Date()), byMonth);
            return getFilterReport(orderList, totalAmountReport);
        } else if (byDay != null && byMonth != null && byYear == null) {
            return null;
        } else if (byDay == null && byMonth != null && byYear != null) {
            return null;
        } else if (byDay == null && byMonth == null && byYear != null) {
            orderList = orderRepository.filterByYear(byYear.toString());
            totalAmountReport = orderRepository.totalAmountByYear(byYear.toString());
            return getFilterReport(orderList, totalAmountReport);
        } else {
            throw new NotFoundException(RESPONSE_FAIL_REPORT);
        }
    }

    public AdminOrderSummary getAllOrdersAdmin(Long userId, Long filterId) throws NotFoundException {
        AdminOrderSummary adminOrderSummary = new AdminOrderSummary();
        List<OrderDtoForAdmin> orderDtoList = new ArrayList<>();
        List<Order> orderList = new ArrayList<>();
        Optional<User> userOptional = userRepository.findById(userId);
        Double totalAmount = 0D;
        if (userOptional.get().getRole().equals("admin") || userOptional.get().getRole().equals("sales")) {
            if (filterId == 1) {
                // All products
                orderList = orderRepository.findAll();
            } else if (filterId == 2) {
                // Orders by day
                orderList = orderRepository.getAllOrderByDay(publicFunction.getDay(new Date()));
                System.out.println(publicFunction.getDay(new Date()));
            } else if (filterId == 3) {
                // Orders by Month
                orderList = orderRepository.getAllOrderByMonth(publicFunction.getMonth(new Date()));
            } else if (filterId == 4) {
                // Orders by Years
                orderList = orderRepository.getAllOrderByYear(publicFunction.getYear(new Date()));
            }
            for (Order order: orderList) {
                List<OrderItem> orderItemList = new ArrayList<>();
                orderItemList = orderItemRepository.findByOrderId(order.getId());
                if (orderList.isEmpty()) {
                    throw new NotFoundException(RESPONSE_NOT_FOUND_ORDER);
                }
                StringBuilder productLists = new StringBuilder();
                for (int i = 0; i < orderItemList.size(); i++) {
                    OrderItem orderItem = orderItemList.get(i);
                    Optional<Product> productOptional = productRepository.findById(orderItem.getProductId());
                    productLists.append(productOptional.get().getName());
                    if (i < orderItemList.size() - 1) {
                        productLists.append(", ");
                    }
                }
                Optional<User> optionalUser = userRepository.findById(order.getCustomerId());
                OrderDtoForAdmin orderDtoForAdmin = new OrderDtoForAdmin();
                Optional<Product> productOptional = productRepository.findById(orderItemList.get(0).getProductId());
                orderDtoForAdmin.setSrc(productOptional.get().getSrc());
                orderDtoForAdmin.setId(order.getId());
                orderDtoForAdmin.setTotalAmount(order.getTotalAmount());
                orderDtoForAdmin.setCreatedAt(publicFunction.formatTime(order.getCreatedAt()));
                orderDtoForAdmin.setStatus(getStatusOrder(order.getStatusId()));
                orderDtoForAdmin.setListProducts(productLists.toString());
                orderDtoForAdmin.setUsername(optionalUser.get().getUsername());
                orderDtoForAdmin.setAddress(optionalUser.get().getAddress());
                orderDtoForAdmin.setNameCustomer(optionalUser.get().getName());
                orderDtoForAdmin.setPhoneNumber(optionalUser.get().getPhone());
                orderDtoList.add(orderDtoForAdmin);
                totalAmount +=  order.getTotalAmount();
            }
            System.out.println(RESPONSE_LIST_ORDERS);
            adminOrderSummary.setOrderDtoForAdminList(orderDtoList);
            adminOrderSummary.setTotalOrders(Long.valueOf(orderList.size()));
            Long successOrders = orderList.stream().filter(order -> order.getStatusId() == 4L).count();
            adminOrderSummary.setSuccessOrders(successOrders);
            Long receivedOrders = orderList.stream().filter(order -> order.getStatusId() == 1L).count();
            adminOrderSummary.setOrdersReceived(receivedOrders);
            adminOrderSummary.setTotalAmount(totalAmount);
            return adminOrderSummary;
        } else {
            throw new NotFoundException(RESPONSE_NOT_FOUND_ORDER);
        }
    }

    public String updateStatusOrder(Long id, Long orderId) throws NotFoundException {
        Optional<User> userOptional = userRepository.findById(id);
        if (userOptional.get().getRole().equals("admin") || userOptional.get().getRole().equals("sales")) {
            Optional<Order> orderOptional = orderRepository.findById(orderId);
            if (orderOptional.isPresent()) {
                Order order = orderOptional.get();
                if (order.getStatusId() < 5) {
                    order.setStatusId(order.getStatusId() + 1);
                    if (order.getStatusId() == 5) {
                        List<OrderItem> orderItemList = orderItemRepository.findByOrderId(orderId);
                        for (OrderItem orderItem : orderItemList) {
                            Optional<Product> productOptional = productRepository.findById(orderItem.getProductId());
                            Product product = productOptional.get();
                            product.setQuantity(productOptional.get().getQuantity() + orderItem.getQuantity());
                            productRepository.save(product);
                        }
                    }
                }
                orderRepository.save(order);
                return "Update successfully";
            } else {
                return "Update fail";
            }
        } else {
            throw new NotFoundException(RESPONSE_NOT_FOUND_ORDER);
        }
    }

    public String cancelOrder(Long userId, Long orderId) throws NotFoundException {
        Optional<Order> orderOptional = orderRepository.findById(orderId);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            if (orderOptional.get().getStatusId() > 0 && orderOptional.get().getStatusId() < 3) {
                order.setStatusId(5L);
                List<OrderItem> orderItemList = orderItemRepository.findByOrderId(orderId);
                for (OrderItem orderItem : orderItemList) {
                    Optional<Product> productOptional = productRepository.findById(orderItem.getProductId());
                    Product product = productOptional.get();
                    product.setQuantity(productOptional.get().getQuantity() + orderItem.getQuantity());
                    productRepository.save(product);
                }
            }
        } else {
            throw new NotFoundException("Không hủy đc đơn này!");
        }
        return null;
    }

//    public String updateOrderAdmin(Long userId, OrderDtoForAdmin orderDtoForAdmin) throws NotFoundException {
//        Optional<User> userOptional = userRepository.findById(userId);
//        try {
//            if (userOptional.get().getRole().equals("admin") || userOptional.get().getRole().equals("sales")) {
//                Optional<Order> orderOptional = orderRepository.findById(orderDtoForAdmin.getId());
//                if (orderOptional.isPresent()) {
//                    Order order = orderOptional.get();
//                    return null;
//                }
//            }
//        } catch (Exception e) {
//            throw new NotFoundException(RESPONSE_NOT_FOUND_ORDER);
//        }
//    }
}