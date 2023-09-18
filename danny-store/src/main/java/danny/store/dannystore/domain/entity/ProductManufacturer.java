package danny.store.dannystore.domain.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalDateTime;

@Entity(name = "product_manufacturer")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductManufacturer {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String manufacturer;
    private Long productType;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;
}
