package danny.store.dannystore.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import danny.store.dannystore.domain.dto.CartDto;
import danny.store.dannystore.domain.dto.CartDtoAndAmount;
import danny.store.dannystore.domain.entity.Cart;
import danny.store.dannystore.domain.entity.Product;
import danny.store.dannystore.repository.CartRepository;
import danny.store.dannystore.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CartService {
    private final CartRepository cartRepository;
    private final ProductRepository productRepository;
    @Autowired
    private ObjectMapper objectMapper;
    public CartDtoAndAmount getListCart(Long userId) {
        CartDtoAndAmount cartDtoAndAmount = new CartDtoAndAmount();
        List<Cart> cartList = cartRepository.findByUserId(userId);
        List<CartDto> cartDtoList = new ArrayList<>();
        Long countTotalAmount = 0L;
        for (Cart cart : cartList) {
            CartDto cartDto = new CartDto();
            cartDto.setId(cart.getId());
            cartDto.setQuantity(cart.getQuantity());
            Optional<Product> productOptional = productRepository.findById(cart.getProductId());
            if (productOptional.isPresent()) {
                Product product = productOptional.get();
                cartDto.setNameProduct(product.getName());
                cartDto.setPrice(product.getPrice());
                cartDto.setSrc(product.getSrc());
            }
            cartDtoList.add(cartDto);
            countTotalAmount += Long.valueOf(cartDto.getPrice()) * Long.valueOf(cartDto.getQuantity());
        }
        cartDtoAndAmount.setCartDtoList(cartDtoList);
        cartDtoAndAmount.setTotalAmount(countTotalAmount);
        return cartDtoAndAmount;
    }
}
