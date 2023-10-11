package danny.store.dannystore.domain.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "cart_detail")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private Long cartId;
    private Long productId;
    private Long quantity;
    private Long price;
    private Long totalAmount;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;
}
