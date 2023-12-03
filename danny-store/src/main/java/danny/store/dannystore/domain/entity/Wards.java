package danny.store.dannystore.domain.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "wards")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Wards {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long wardsId;
    private Long districtId;
    private String name;
}
