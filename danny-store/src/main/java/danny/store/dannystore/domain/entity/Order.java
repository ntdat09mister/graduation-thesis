package danny.store.dannystore.domain.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "`order`")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long saleStaffId;
    private Long customerId;
    private Float totalAmount;
    private Long statusId;
    private String deliveryAddress;
    private String phone;
    private Long paymentStatus;
    private Date createdAt;
    private Date modifiedAt;
}