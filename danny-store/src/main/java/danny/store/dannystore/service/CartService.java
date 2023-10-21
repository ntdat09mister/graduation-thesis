package danny.store.dannystore.service;

import danny.store.dannystore.domain.dto.CartDto;
import danny.store.dannystore.domain.dto.CartDtoAndAmount;
import danny.store.dannystore.domain.entity.Cart;
import danny.store.dannystore.domain.entity.CartDetail;
import danny.store.dannystore.domain.entity.Product;
import danny.store.dannystore.repository.CartDetailRepository;
import danny.store.dannystore.repository.CartRepository;
import danny.store.dannystore.repository.ProductRepository;
import javassist.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import static danny.store.dannystore.common.Const.RESPONSE_ADD_TO_CART_FAIL;
import static danny.store.dannystore.common.Const.RESPONSE_ADD_TO_CART_SUCCESS;

@Service
@RequiredArgsConstructor
public class CartService {
    private final CartRepository cartRepository;
    private final ProductRepository productRepository;
    private final CartDetailRepository cartDetailRepository;
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
    @Transactional(rollbackOn = Exception.class)
    public String addToCart(Long userId, Long productId, Long quantity, Long price) throws NotFoundException {
        Optional<Product> productOptional = productRepository.findById(productId);
        if (productOptional.isPresent() && productOptional.get().getQuantity() >= quantity) {
            Cart cart = new Cart();
            cart.setUserId(userId);
            cart.setCreatedAt(new Date());
            cart.setModifiedAt(new Date());
            cartRepository.save(cart);
            CartDetail cartDetail = new CartDetail();
            cartDetail.setProductId(productId);
            cartDetail.setCartId(cart.getId());
            cartDetail.setQuantity(quantity);
            cartDetail.setPrice(price);
            cartDetail.setCreatedAt(new Date());
            cartDetail.setModifiedAt(new Date());
            cartDetailRepository.save(cartDetail);
            Product product = productOptional.get();
            product.setQuantity(productOptional.get().getQuantity() - quantity);
            productRepository.save(product);
            return RESPONSE_ADD_TO_CART_SUCCESS;
        } else {
            throw new NotFoundException(RESPONSE_ADD_TO_CART_FAIL);
        }

    }
}
