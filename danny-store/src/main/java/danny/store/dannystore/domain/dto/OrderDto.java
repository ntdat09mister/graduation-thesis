package danny.store.dannystore.domain.dto;
import lombok.Data;
@Data
public class OrderDto {
    private Long id;
    private String src;
    private String listProducts;
    private Long totalAmount;
    private String status;
    private String createdAt;
}
