package danny.store.dannystore.domain.dto;

import lombok.Data;

@Data
public class CartDto {
    private String src;
    private String nameProduct;
    private String price;
    private Long quantity;
}
