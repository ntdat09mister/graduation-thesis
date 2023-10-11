package danny.store.dannystore.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import danny.store.dannystore.domain.dto.CartDto;
import danny.store.dannystore.domain.dto.CartDtoAndAmount;
import danny.store.dannystore.domain.entity.Cart;
import danny.store.dannystore.domain.entity.CartDetail;
import danny.store.dannystore.domain.entity.Product;
import danny.store.dannystore.repository.CartDetailRepository;
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
    private final CartDetailRepository cartDetailRepository;
    @Autowired
    private ObjectMapper objectMapper;
//    public CartDtoAndAmount getListCart(Long userId) {
//        CartDtoAndAmount cartDtoAndAmount = new CartDtoAndAmount();
//        List<Cart> cartList = cartRepository.findByUserId(userId);
//        List<CartDto> cartDtoList = new ArrayList<>();
//        Long countTotalAmount = 0L;
//        for (Cart cart : cartList) {
//            Optional<CartDetail> cartDetailOptional = cartDetailRepository.findById(cart.getId());
//            CartDetail cartDetail = new CartDetail();
//            cartDetail.setId(cart.getId());
//            cartDetail.setQuantity(cartDetail.getQuantity());
//            Optional<Product> productOptional = productRepository.findById(cartDetailOptional.get().getProductId());
//            if (productOptional.isPresent()) {
//                Product product = productOptional.get();
//                cartDetail.setProductId(product.getId());
//            }
//            cartDtoList.add(cartDetail);
//            countTotalAmount += Long.valueOf(cartDetail.getPrice()) * Long.valueOf(cartDetail.getQuantity());
//        }
//        cartDtoAndAmount.setCartDtoList(cartDtoList);
//        cartDtoAndAmount.setTotalAmount(countTotalAmount);
//        return cartDtoAndAmount;
//    }
    public CartDtoAndAmount getListCartsUser(Long userId) {
        CartDtoAndAmount cartDtoAndAmount = new CartDtoAndAmount();
        List<CartDto> cartDtoList = new ArrayList<>();
        List<Cart> cartList = cartRepository.findByUserId(userId);
        Long countTotalAmount = 0L;
        for (Cart cart: cartList) {
            CartDetail cartDetail = cartDetailRepository.findByCartId(cart.getId());
            CartDto cartDto = new CartDto();
            Optional<Product> productOptional = productRepository.findById(cartDetail.getProductId());
            if (productOptional.isPresent()) {
                Product product = productOptional.get();
                cartDto.setSrc(product.getSrc());
                cartDto.setPrice(product.getPrice());
                cartDto.setNameProduct(product.getName());
            }
            cartDto.setQuantity(cartDetail.getQuantity());
            cartDtoList.add(cartDto);
            countTotalAmount += Long.valueOf(cartDetail.getPrice()) * Long.valueOf(cartDetail.getQuantity());
        }
        cartDtoAndAmount.setTotalAmount(countTotalAmount);
        cartDtoAndAmount.setCartDtoList(cartDtoList);
        return cartDtoAndAmount;
    }
}
