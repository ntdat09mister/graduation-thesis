package danny.store.dannystore.domain.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalDateTime;

public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long userId;
    private Long totalAmount;
    private Long status;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;
}
