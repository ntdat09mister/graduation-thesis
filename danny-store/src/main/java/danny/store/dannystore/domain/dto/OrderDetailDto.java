package danny.store.dannystore.domain.dto;
import lombok.Data;

import java.util.List;

@Data
public class OrderDetailDto {
    private Long orderId;
    private String nameCustomer;
    private String address;
    private String phoneNumber;
    private Long userId;
    private List<OrderItemDto> orderItemList;
    private Float totalAmount;
    private String createdAt;
}
