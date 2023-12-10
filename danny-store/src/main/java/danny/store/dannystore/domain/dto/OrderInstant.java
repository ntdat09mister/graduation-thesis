package danny.store.dannystore.domain.dto;

import lombok.Data;

@Data
public class OrderInstant {
    private Long productId;
    private Long price;
    private String classify;
}
