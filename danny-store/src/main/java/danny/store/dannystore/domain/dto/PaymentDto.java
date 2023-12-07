package danny.store.dannystore.domain.dto;

import lombok.Data;

@Data
public class PaymentDto {
    private Long orderId;
    private String address;
    private String phoneNumber;
}
