package danny.store.dannystore.domain.dto;

import lombok.Data;

@Data
public class ProductDto {
    private Long id;
    private String name;
    private String originalPrice;
    private String sellingPrice;
    private String description;
    private String src;
    private Long quantity;
}
