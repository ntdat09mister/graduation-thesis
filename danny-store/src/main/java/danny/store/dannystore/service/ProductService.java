package danny.store.dannystore.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import danny.store.dannystore.domain.dto.AdminProductSummaryDto;
import danny.store.dannystore.domain.dto.ProductDto;
import danny.store.dannystore.domain.dto.ProductDtoForAdmin;
import danny.store.dannystore.domain.entity.*;
import danny.store.dannystore.repository.*;
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
    private final PromotionRepository promotionRepository;
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
            Float valuePercent = 0F;
            for (Product product : products) {
                ProductDto productDto = new ProductDto();
                productDto.setId(product.getId());
                productDto.setName(product.getName());
                productDto.setOriginalPrice(String.valueOf(product.getPrice()));
                Optional<Promotion> promotionOptional = promotionRepository.findById(product.getPromotionId());
                if (promotionOptional.isPresent()) {
                    valuePercent = promotionOptional.get().getPercentValue();
                }
                productDto.setSellingPrice(String.valueOf(product.getPrice() - product.getPrice() * valuePercent / 100 ));
                String[] fullString = product.getDescription().split("\\n");
                if (fullString.length > 0) {
                    fullString[0] = fullString[0].substring(1);
                }
                productDto.setDescription(fullString[0]);
                productDto.setSrc(product.getSrc());
                productDto.setQuantity(product.getQuantity());
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
            String cleanText = productDto.getDescription().replaceAll("\\n\\n", "\n");
            String cleanedText = cleanText.replaceFirst("^[^\n]*\n", "");
            productDto.setDescription(cleanedText);
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
            String[] fullString = product.getDescription().split("\\n");
            if (fullString.length > 0) {
                fullString[0] = fullString[0].substring(1);
            }
            productDto.setDescription(fullString[0]);
            productDtos.add(productDto);
        }
        return productDtos;
    }

    public AdminProductSummaryDto getListProductsAdmin(Long id) throws NotFoundException {
        AdminProductSummaryDto adminProductSummaryDto = new AdminProductSummaryDto();
        Optional<User> userOptional = userRepository.findById(id);
        if (userOptional.get().getRole().equals("admin") || userOptional.get().getRole().equals("warehouse")) {
            List<ProductDtoForAdmin> productDtoForAdminList = new ArrayList<>();
            List<Product> products = productRepository.findAll();
            for (Product product: products) {
                ProductDtoForAdmin productDtoForAdmin = objectMapper.convertValue(product, ProductDtoForAdmin.class);
                productDtoForAdmin.setStatusProduct(product.getStatus());
                String[] fullString = product.getDescription().split("\\n");
                if (fullString.length > 0) {
                    fullString[0] = fullString[0].substring(1);
                }
                productDtoForAdmin.setDescription(fullString[0]);
                Optional<Promotion> promotionOptional = promotionRepository.findById(product.getPromotionId());
                productDtoForAdmin.setPromotion(String.valueOf(promotionOptional.get().getPercentValue()));
                productDtoForAdminList.add(productDtoForAdmin);
            }
            adminProductSummaryDto.setProductDtoForAdminList(productDtoForAdminList);
            Long productsCountTrue = products.stream().filter(product -> product.getStatus() == true).count();
            adminProductSummaryDto.setCountProductsTrue(productsCountTrue);
            Long productCountAll = Long.valueOf(products.size());
            adminProductSummaryDto.setCountProductsAll(productCountAll);
            Long quantityProducts = products.stream().mapToLong(Product::getQuantity).sum();
            adminProductSummaryDto.setCountTotalProducts(quantityProducts);
            return adminProductSummaryDto;
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

    public String updateProduct(Long userId, ProductDtoForAdmin productDtoForAdmin) throws NotFoundException {
        Optional<User> userOptional = userRepository.findById(userId);
        try {
            if (userOptional.get().getRole().equals("admin") || userOptional.get().getRole().equals("warehouse")) {
                Optional<Product> productOptional = productRepository.findById(productDtoForAdmin.getId());
                if (productOptional.isPresent()) {
                    Product product = productOptional.get();
                    product.setName(productDtoForAdmin.getName());
                    product.setPrice(Float.parseFloat(productDtoForAdmin.getPrice()));
                    product.setDescription(productDtoForAdmin.getDescription());
                    product.setQuantity(productDtoForAdmin.getQuantity());
                    product.setStatus(productDtoForAdmin.getStatusProduct());
                    product.setPromotionId(productDtoForAdmin.getPromotionId());
                    productRepository.save(product);
                }
                return RESPONSE_UPDATE_SUCCESS;
            } else {
                throw new NotFoundException(RESPONSE_NOT_FOUND_PRODUCT);
            }
        } catch (Exception e) {
            throw new NotFoundException(RESPONSE_NOT_FOUND_PRODUCT);
        }
    }
}
