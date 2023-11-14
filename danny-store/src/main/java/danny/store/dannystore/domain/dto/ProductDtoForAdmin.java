package danny.store.dannystore.domain.dto;

import lombok.Data;

@Data
public class ProductDtoForAdmin {
    private Long id;
    private String name;
    private String price;
    private String description;
    private String src;
    private Long quantity;
    private Boolean statusProduct;
}