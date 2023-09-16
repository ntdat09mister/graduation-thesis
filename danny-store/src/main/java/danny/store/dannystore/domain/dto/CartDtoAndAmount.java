package danny.store.dannystore.domain.dto;

import lombok.Data;

import java.util.List;

@Data
public class CartDtoAndAmount {
    private List<CartDto> cartDtoList;
    private Long totalAmount;
}
