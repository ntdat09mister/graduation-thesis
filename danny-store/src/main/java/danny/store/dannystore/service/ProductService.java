package danny.store.dannystore.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import danny.store.dannystore.domain.dto.ProductDto;
import danny.store.dannystore.domain.dto.ProductDtoForAdmin;
import danny.store.dannystore.domain.entity.Product;
import danny.store.dannystore.domain.entity.ProductDetail;
import danny.store.dannystore.domain.entity.ProductManufacturer;
import danny.store.dannystore.domain.entity.User;
import danny.store.dannystore.repository.ProductDetailRepository;
import danny.store.dannystore.repository.ProductManufacturerRepository;
import danny.store.dannystore.repository.ProductRepository;
import danny.store.dannystore.repository.UserRepository;
import javassist.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static danny.store.dannystore.common.Const.*;

@Service
@RequiredArgsConstructor
public class ProductService {
    @Autowired
    private ObjectMapper objectMapper;
    private final ProductRepository productRepository;
    private final ProductManufacturerRepository manufacturerRepository;
    private final ProductDetailRepository productDetailRepository;
    private final UserRepository userRepository;
    public List<ProductDto> getListProducts(Long productType, Long manufacturerId) throws NotFoundException {
        try {
            List<ProductDto> productDtos = new ArrayList<>();
            List<Product> products = new ArrayList<>();
            if (productType != null && manufacturerId != null && manufacturerId != 0L) {
                products = productRepository.getProductsByProductTypeAndManufacturerId(productType, manufacturerId, true);
            } else if (productType != null & manufacturerId == null){
                products = productRepository.getProductsByProductType(productType, true);
            } else if (manufacturerId == null){
                products = productRepository.findAllProducts(true);
            } else {
                products = productRepository.findAllProducts(true);
            }
            for (Product product : products) {
                ProductDto productDto = objectMapper.convertValue(product, ProductDto.class);
                productDtos.add(productDto);
            }
            return productDtos;
        } catch (Exception e) {
            throw new NotFoundException(RESPONSE_NOT_FOUND_PRODUCT);
        }

    }

    public List<ProductManufacturer> getListProductManufacturers() {
        return manufacturerRepository.findAll();
    }

    public List<ProductDetail> getProductImgDetail(Long productId) {
        List<ProductDetail> productDetails = productDetailRepository.findByProductId(productId);
        if (!productDetails.isEmpty()) {
            productDetails = productDetailRepository.findByProductId(productId);
        } else {
            productDetails = productDetailRepository.findByProductId(1L);
        }
        return productDetails;
    }

    public ProductDto getProductDtoById(Long id) throws ClassNotFoundException {
        Optional<Product> productOptional = productRepository.findById(id);
        if (productOptional.isPresent()) {
            ProductDto productDto = objectMapper.convertValue(productOptional, ProductDto.class);
            return productDto;
        } else {
            throw new ClassNotFoundException();
        }
    }

    public List<ProductDto> searchProductDtosByName(String name) {
        List<Product> productList = productRepository.searchProductDtosByName(name);
        List<ProductDto> productDtos = new ArrayList<>();
        for (Product product : productList) {
            ProductDto productDto = objectMapper.convertValue(product, ProductDto.class);
            productDtos.add(productDto);
        }
        return productDtos;
    }

    public List<ProductDtoForAdmin> getListProductsAdmin(Long id) throws NotFoundException {
        Optional<User> userOptional = userRepository.findById(id);
        if (userOptional.get().getRole().equals("admin") || userOptional.get().getRole().equals("warehouse")) {
            List<ProductDtoForAdmin> productDtoForAdminList = new ArrayList<>();
            List<Product> products = productRepository.findAll();
            for (Product product: products) {
                ProductDtoForAdmin productDtoForAdmin = objectMapper.convertValue(product, ProductDtoForAdmin.class);
                productDtoForAdmin.setStatusProduct(product.getStatus());
                productDtoForAdminList.add(productDtoForAdmin);
            }
            return productDtoForAdminList;
        } else {
            throw new NotFoundException(RESPONSE_NOT_FOUND_PRODUCT);
        }
    }

    public String updateStatusProduct(Long userId, Long productId) throws NotFoundException {
        Optional<User> userOptional = userRepository.findById(userId);
        try {
            if (userOptional.get().getRole().equals("admin") || userOptional.get().getRole().equals("warehouse")) {
                Optional<Product> productOptional = productRepository.findById(productId);
                if (productOptional.isPresent()) {
                    Product product = productOptional.get();
                    product.setStatus(!product.getStatus());
                    productRepository.save(product);
                }
                return RESPONSE_UPDATE_SUCCESS;
            } else {
                throw new NotFoundException(RESPONSE_NOT_FOUND_USER);
            }

        } catch (Exception e) {
            throw new NotFoundException(RESPONSE_NOT_FOUND_PRODUCT);
        }
    }
}
