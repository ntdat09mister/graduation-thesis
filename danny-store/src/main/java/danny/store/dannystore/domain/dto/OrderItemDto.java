package danny.store.dannystore.domain.dto;

import lombok.Data;
@Data
public class OrderItemDto {
    private Long orderId;
    private String srcProduct;
    private String productName;
    private Float price;
    private Long quantity;
    private String createdAt;
}
