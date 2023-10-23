package danny.store.dannystore.domain.dto;

import danny.store.dannystore.domain.entity.CartDetail;
import lombok.Data;

import java.util.List;

@Data
public class CartDtoAndAmount {
    private List<CartDto> cartDtoList;
    private Float totalAmount;
}
