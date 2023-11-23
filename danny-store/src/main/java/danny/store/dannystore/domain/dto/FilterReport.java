
package danny.store.dannystore.domain.dto;

import lombok.Data;

import java.util.List;

@Data
public class FilterReport {
    private List<ReportItemDto> reportDtoList;
    private Float totalAmount;
    private Long totalOrders;
    private Long successOrders;
    private Long ordersReceived;
}