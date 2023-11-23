package danny.store.dannystore.domain.dto;

import lombok.Data;

import java.util.List;

@Data
public class AdminOrderSummary {
    List<OrderDtoForAdmin> orderDtoForAdminList;
    private Double totalAmount;
    private Long totalOrders;
    private Long successOrders;
    private Long ordersReceived;
}
