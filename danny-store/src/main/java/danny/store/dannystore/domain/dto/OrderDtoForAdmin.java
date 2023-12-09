package danny.store.dannystore.domain.dto;

import lombok.Data;

@Data
public class OrderDtoForAdmin {
    private Long id;
    private String src;
    private String listProducts;
    private Long totalAmount;
    private String username;
    private String nameCustomer;
    private String phoneNumber;
    private String address;
    private String status;
    private Long paymentStatus;
    private Long statusId;
    private String createdAt;
}
