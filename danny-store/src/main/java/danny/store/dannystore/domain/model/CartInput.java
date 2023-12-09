package danny.store.dannystore.domain.model;

import lombok.Data;

@Data
public class CartInput {
    private Long productId;
    private Long quantity;
    private Long priceCoefficient;
}