package danny.store.dannystore.domain.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "receipt_import_detail")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReceiptImportDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long receiptImportId;
    private Long productId;
    private Long quantity;
    private Long price;
    private Long totalAmount;
}
