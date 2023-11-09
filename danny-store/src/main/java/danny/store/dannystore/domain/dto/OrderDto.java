package danny.store.dannystore.domain.dto;
import lombok.Data;
@Data
public class OrderDto {
    private Long id;
    private String listProducts;
    private Float totalAmount;
    private String status;
    private String createdAt;
}
