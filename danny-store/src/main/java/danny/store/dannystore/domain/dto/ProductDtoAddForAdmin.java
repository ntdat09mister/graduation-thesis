package danny.store.dannystore.domain.dto;

import lombok.Data;

@Data
public class ProductDtoAddForAdmin {
    private String name;
    private String price;
    private String description;
    private Long quantity;
}
