package danny.store.dannystore.domain.dto;

import lombok.Data;

@Data
public class ReportItemDto {
    private Long orderId;
    private String customerName;
    private String saleStaffName;
    private Long totalAmount;
    private String status;
    private String createdAt;
}