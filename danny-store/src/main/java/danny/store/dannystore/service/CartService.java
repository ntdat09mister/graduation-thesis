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

import static danny.store.dannystore.common.Const.*;

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
        Long countTotalAmount = 0L;
        for (Cart cart: cartList) {
            List<CartDetail> cartDetails = cartDetailRepository.findByCartId(cart.getId());
            CartDto cartDto = new CartDto();
            Optional<Product> productOptional = productRepository.findById(cartDetails.get(0).getProductId());
            if (productOptional.isPresent()) {
                Product product = productOptional.get();
                cartDto.setSrc(product.getSrc());
                cartDto.setNameProduct(product.getName());
                cartDto.setProductId(product.getId());
                cartDto.setCreatedAt(publicFunction.formatTime(cart.getCreatedAt()));
            }
            cartDto.setCartId(cart.getId());
            cartDto.setPrice(cartDetails.get(0).getPrice());
            cartDto.setQuantity(cartDetails.get(0).getQuantity());
            cartDto.setClassify(cartDetails.get(0).getClassify());
            cartDtoList.add(cartDto);
            countTotalAmount += Long.valueOf(cartDetails.get(0).getPrice()) * Long.valueOf(cartDetails.get(0).getQuantity());
        }
        cartDtoAndAmount.setTotalAmount(countTotalAmount);
        cartDtoAndAmount.setCartDtoList(cartDtoList);
        System.out.println("Select all cart from user login");
        return cartDtoAndAmount;
    }
    private List<CartDto> getListCartDto(Long userId) {
        List<CartDto> cartDtoList = new ArrayList<>();
        List<Cart> cartList = cartRepository.findByUserId(userId);
        for (Cart cart: cartList) {
            List<CartDetail> cartDetails = cartDetailRepository.findByCartId(cart.getId());
            CartDto cartDto = new CartDto();
            Optional<Product> productOptional = productRepository.findById(cartDetails.get(0).getProductId());
            if (productOptional.isPresent()) {
                Product product = productOptional.get();
                cartDto.setSrc(product.getSrc());
                cartDto.setNameProduct(product.getName());
                cartDto.setProductId(product.getId());
                cartDto.setCreatedAt(publicFunction.formatTime(cart.getCreatedAt()));
            }
            cartDto.setCartId(cart.getId());
            cartDto.setPrice(cartDetails.get(0).getPrice());
            cartDto.setQuantity(cartDetails.get(0).getQuantity());
            cartDto.setClassify(cartDetails.get(0).getClassify());
            cartDtoList.add(cartDto);
        }
        return cartDtoList;
    }
    @Transactional(rollbackOn = Exception.class)
    public String addToCart(Long userId, CartInput cartInput) throws NotFoundException {
        List<CartDto> cartDtoList = getListCartDto(userId);
        Optional<Product> productOptional = productRepository.findById(cartInput.getProductId());
        Product product = productOptional.get();
        if (productOptional.isPresent() && productOptional.get().getQuantity() >= cartInput.getQuantity()) {
            Optional<CartDto> existCart = cartDtoList.stream().filter(cartDto -> cartDto.getProductId().equals(cartInput.getProductId()) && cartDto.getClassify().equals(cartInput.getClassify())).findFirst();
            if (existCart.isPresent()) {
                List<CartDetail> cartDetails = cartDetailRepository.findByCartId(existCart.get().getCartId());
                CartDetail cartDetail = cartDetails.get(0);
                cartDetail.setQuantity(cartDetail.getQuantity() + 1);
                cartDetail.setPrice(cartInput.getPriceCoefficient());
                product.setQuantity(productOptional.get().getQuantity() - 1);
                cartDetailRepository.save(cartDetail);
            } else {
            Cart cart = new Cart();
            cart.setUserId(userId);
            cart.setCreatedAt(new Date());
            cart.setModifiedAt(new Date());
            cartRepository.save(cart);
            CartDetail cartDetail = new CartDetail();
            cartDetail.setProductId(cartInput.getProductId());
            cartDetail.setCartId(cart.getId());
            cartDetail.setQuantity(cartInput.getQuantity());
            cartDetail.setClassify(cartInput.getClassify());
            cartDetail.setPrice(cartInput.getPriceCoefficient());
            cartDetail.setCreatedAt(new Date());
            cartDetail.setModifiedAt(new Date());
            product.setQuantity(productOptional.get().getQuantity() - 1);
            cartDetailRepository.save(cartDetail);
            }
            productRepository.save(product);
            return RESPONSE_ADD_TO_CART_SUCCESS;
        } else {
            System.out.println(RESPONSE_ADD_TO_CART_FAIL);
            throw new NotFoundException(RESPONSE_ADD_TO_CART_FAIL);
        }
    }

    public String deleteCartWithId(Long userId, Long cartId) throws NotFoundException {
        Cart cart = cartRepository.findByUserIdAndId(userId, cartId);
        if (cart != null) {
            List<CartDetail> cartDetailList = cartDetailRepository.findByCartId(cartId);
            Optional<Product> productOptional = productRepository.findById(cartDetailList.get(0).getProductId());
            Product product = productOptional.get();
            product.setQuantity(productOptional.get().getQuantity() + cartDetailList.get(0).getQuantity());
            productRepository.save(product);
            cartRepository.deleteById(cartId);
            cartDetailRepository.deleteById(cartId);
            return "Delete success!";
        } else {
            throw new NotFoundException(RESPONSE_ADD_TO_CART_FAIL);
        }
    }

    public String updateCartQuantity(Long userId, Boolean statusUpdate, Long cartId) {
        List<Cart> cartList = cartRepository.findByUserId(userId);
        Boolean checkCartExist = cartList.stream().anyMatch(cart -> cart.getId() == cartId);
        if (checkCartExist) {
            List<CartDetail> cartDetails = cartDetailRepository.findByCartId(cartId);
            Optional<Product> productOptional = productRepository.findById(cartDetails.get(0).getProductId());
            Product product = productOptional.get();
            if (statusUpdate) {
                cartDetails.get(0).setQuantity(cartDetails.get(0).getQuantity() + 1);
                product.setQuantity(product.getQuantity() - 1);
            } else {
                cartDetails.get(0).setQuantity(cartDetails.get(0).getQuantity() - 1);
                product.setQuantity(product.getQuantity() + 1);
                if (cartDetails.get(0).getQuantity() == 0) {
                    cartRepository.deleteById(cartId);
                    cartDetailRepository.deleteByCartId(cartId);
                    product.setQuantity(product.getQuantity() + 1);
                }
            }
            cartDetailRepository.save(cartDetails.get(0));
            productRepository.save(product);
        }
        return RESPONSE_UPDATE_SUCCESS;
    }
}
