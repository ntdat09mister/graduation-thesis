package danny.store.dannystore.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import danny.store.dannystore.domain.dto.AdminProductSummaryDto;
import danny.store.dannystore.domain.dto.ProductDto;
import danny.store.dannystore.domain.dto.ProductDtoAddForAdmin;
import danny.store.dannystore.domain.dto.ProductDtoForAdmin;
import danny.store.dannystore.domain.entity.*;
import danny.store.dannystore.repository.*;
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
            Long valuePercent = 0L;
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
            productDto.setOriginalPrice(String.valueOf(productOptional.get().getPrice()));
            Optional<Promotion> promotionOptional = promotionRepository.findById(productOptional.get().getPromotionId());
            productDto.setSellingPrice(String.valueOf(productOptional.get().getPrice() - promotionOptional.get().getPercentValue() * productOptional.get().getPrice() / 100));
            return productDto;
        } else {
            throw new ClassNotFoundException();
        }
    }

    public List<ProductDto> searchProductDtosByName(String name, String filterId) {
        List<Product> productList = new ArrayList<>();
        if (filterId.equals("1")) {
            productList = productRepository.searchProductDtosByNameDesc(name);
        }
        if (filterId.equals("0")) {
            productList = productRepository.searchProductDtosByName(name);
        }
        List<ProductDto> productDtos = new ArrayList<>();
        Long valuePercent = 0L;
        for (Product product : productList) {
            ProductDto productDto = objectMapper.convertValue(product, ProductDto.class);
            productDto.setOriginalPrice(String.valueOf(product.getPrice()));
            Optional<Promotion> promotionOptional = promotionRepository.findById(product.getPromotionId());
            if (promotionOptional.isPresent()) {
                valuePercent = promotionOptional.get().getPercentValue();
            }
            productDto.setSellingPrice(String.valueOf((product.getPrice() - product.getPrice() * valuePercent / 100)));
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
                Optional<ProductManufacturer> manufacturer = manufacturerRepository.findById(product.getManufacturerId());
//                productDtoForAdmin.setManufacturer(manufacturer.get().getManufacturer());
                String[] fullString = product.getDescription().split("\\n");
//                if (fullString.length > 0) {
//                    fullString[0] = fullString[0].substring(1);
//                }
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
                    product.setPrice(Long.parseLong(productDtoForAdmin.getPrice()));
                    product.setDescription(productDtoForAdmin.getDescription());
                    product.setQuantity(productDtoForAdmin.getQuantity());
                    product.setStatus(productDtoForAdmin.getStatusProduct());
                    product.setPromotionId(productDtoForAdmin.getPromotionId());
                    productRepository.save(product);
                }
                return RESPONSE_UPDATE_SUCCESS;
            } else {
                throw new NotFoundException(RESPONSE_UNAUTHORIZED);
            }
        } catch (Exception e) {
            throw new NotFoundException(RESPONSE_NOT_FOUND_PRODUCT);
        }
    }
    @Transactional(rollbackOn = Exception.class)
    public String createProduct(Long userId, ProductDtoAddForAdmin productDtoAddForAdmin) throws NotFoundException {
        Optional<User> userOptional = userRepository.findById(userId);
        try {
            if (userOptional.get().getRole().equals("admin") || userOptional.get().getRole().equals("warehouse")) {
                Product product = new Product();
                product.setName(productDtoAddForAdmin.getName());
                product.setQuantity(productDtoAddForAdmin.getQuantity());
                product.setDescription(productDtoAddForAdmin.getDescription());
                product.setPrice(Long.parseLong(productDtoAddForAdmin.getPrice()));
                product.setSrc("https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/tecno-spark-10_5_.png");
                product.setCreatedAt(new Date());
                product.setStatus(false);
                product.setPromotionId(1L);
                product.setProductType(1L);
                product.setManufacturerId(9L);
                productRepository.save(product);
                for (int i=0 ; i < 4 ; i ++) {
                    ProductDetail productDetail = new ProductDetail();
                    productDetail.setProductId(product.getId());
                    productDetail.setImageSrc("https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/tecno-spark-10_6_.png");
                    productDetail.setCreatedAt(new Date());
                    productDetailRepository.save(productDetail);
                }
            }  else {
                throw new NotFoundException(RESPONSE_UNAUTHORIZED);
            }
        } catch (Exception e) {
            throw new NotFoundException("Thêm thất bại!");
        }
        return null;
    }
}
