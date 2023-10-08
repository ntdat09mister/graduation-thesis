package danny.store.dannystore.domain.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "evaluate")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Evaluate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long userId;
    private Long voteStars;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;
}
