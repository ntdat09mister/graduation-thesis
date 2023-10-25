package danny.store.dannystore.domain.dto;

import lombok.Data;
@Data
public class OrderItemDto {
    private Long id;
    private Long orderId;
    private Long productId;
    private Float price;
    private Long quantity;
    private String createdAt;
    private String modifiedAt;
}
