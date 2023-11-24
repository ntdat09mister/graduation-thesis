package danny.store.dannystore.domain.dto;

import lombok.Data;

import java.util.List;

@Data
public class AdminProductSummaryDto {
    private List<ProductDtoForAdmin> productDtoForAdminList;
    private Long countProductsTrue;
    private Long countProductsAll;
    private Long countTotalProducts;
}
