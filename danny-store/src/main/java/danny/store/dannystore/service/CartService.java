package danny.store.dannystore.service;

import danny.store.dannystore.domain.dto.CartDto;
import danny.store.dannystore.domain.dto.CartDtoAndAmount;
import danny.store.dannystore.domain.entity.Cart;
import danny.store.dannystore.domain.entity.CartDetail;
import danny.store.dannystore.domain.entity.Product;
import danny.store.dannystore.domain.model.CartInput;
import danny.store.dannystore.repository.CartDetailRepository;
import danny.store.dannystore.repository.CartRepository;
import danny.store.dannystore.repository.ProductRepository;
import javassist.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private PublicFunction publicFunction;
    public CartDtoAndAmount getListCartsUser(Long userId) {
        CartDtoAndAmount cartDtoAndAmount = new CartDtoAndAmount();
        List<CartDto> cartDtoList = new ArrayList<>();
        List<Cart> cartList = cartRepository.findByUserId(userId);
        Float countTotalAmount = 0F;
        for (Cart cart: cartList) {
            CartDetail cartDetail = cartDetailRepository.findByCartId(cart.getId());
            CartDto cartDto = new CartDto();
            Optional<Product> productOptional = productRepository.findById(cartDetail.getProductId());
            if (productOptional.isPresent()) {
                Product product = productOptional.get();
                cartDto.setSrc(product.getSrc());
                cartDto.setNameProduct(product.getName());
                cartDto.setProductId(product.getId());
                cartDto.setCreatedAt(publicFunction.formatTime(cart.getCreatedAt()));
            }
            cartDto.setCartId(cart.getId());
            cartDto.setPrice(cartDetail.getPrice());
            cartDto.setQuantity(cartDetail.getQuantity());
            cartDtoList.add(cartDto);
            countTotalAmount += Float.valueOf(cartDetail.getPrice()) * Float.valueOf(cartDetail.getQuantity());
        }
        cartDtoAndAmount.setTotalAmount(countTotalAmount);
        cartDtoAndAmount.setCartDtoList(cartDtoList);
        System.out.println("Select all cart from user login");
        return cartDtoAndAmount;
    }
    @Transactional(rollbackOn = Exception.class)
    public String addToCart(Long userId, CartInput cartInput) throws NotFoundException {
        Optional<Product> productOptional = productRepository.findById(cartInput.getProductId());
        if (productOptional.isPresent() && productOptional.get().getQuantity() >= cartInput.getQuantity()) {
            Cart cart = new Cart();
            cart.setUserId(userId);
            cart.setCreatedAt(new Date());
            cart.setModifiedAt(new Date());
            cartRepository.save(cart);
            CartDetail cartDetail = new CartDetail();
            cartDetail.setProductId(cartInput.getProductId());
            cartDetail.setCartId(cart.getId());
            cartDetail.setQuantity(cartInput.getQuantity());
            cartDetail.setPrice(productOptional.get().getPrice() * cartInput.getPriceCoefficient());
            cartDetail.setCreatedAt(new Date());
            cartDetail.setModifiedAt(new Date());
            cartDetailRepository.save(cartDetail);
            Product product = productOptional.get();
            product.setQuantity(productOptional.get().getQuantity() - cartInput.getQuantity());
            productRepository.save(product);
            System.out.println("Add success fully cart " + productOptional.get().getName());
            return RESPONSE_ADD_TO_CART_SUCCESS;
        } else {
            System.out.println(RESPONSE_ADD_TO_CART_FAIL);
            throw new NotFoundException(RESPONSE_ADD_TO_CART_FAIL);
        }
    }

    public String deleteCartWithId(Long userId, Long cartId) throws NotFoundException {
        Cart cart = cartRepository.findByUserIdAndId(userId, cartId);
        if (cart != null) {
            cartRepository.deleteById(cartId);
            cartDetailRepository.deleteById(cartId);
            return "Delete success!";
        } else {
            throw new NotFoundException(RESPONSE_ADD_TO_CART_FAIL);
        }
    }
}
