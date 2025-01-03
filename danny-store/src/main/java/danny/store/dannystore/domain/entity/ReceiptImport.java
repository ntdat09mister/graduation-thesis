package danny.store.dannystore.domain.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

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
    private Date createdAt;
    private Date modifiedAt;
}
