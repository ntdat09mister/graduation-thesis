package danny.store.dannystore.domain.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "receipt_import")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReceiptImport {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long idManufacturer;
    private Long userId;
    private Long productId;
    private String productName;
    private Long price;
    private Long totalAmount;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;
}
