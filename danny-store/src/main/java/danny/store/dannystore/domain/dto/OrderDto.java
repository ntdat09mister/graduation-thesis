package danny.store.dannystore.domain.dto;
import danny.store.dannystore.domain.entity.OrderItem;
import lombok.Data;

import java.util.List;

@Data
public class OrderDto {
    private Long orderId;
    private Long userId;
    private List<OrderItem> orderItemList;
    private String createdAt;
}
