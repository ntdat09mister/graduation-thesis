package danny.store.dannystore.domain.dto;
import lombok.Data;

import java.util.List;

@Data
public class OrderDetailDto {
    private Long orderId;
    private Long userId;
    private List<OrderItemDto> orderItemList;
    private String createdAt;
}
