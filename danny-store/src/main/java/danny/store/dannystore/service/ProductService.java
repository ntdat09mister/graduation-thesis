package danny.store.dannystore.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import danny.store.dannystore.domain.dto.ProductDto;
import danny.store.dannystore.domain.entity.Product;
import danny.store.dannystore.domain.entity.ProductDetail;
import danny.store.dannystore.domain.entity.ProductManufacturer;
import danny.store.dannystore.repository.ProductDetailRepository;
import danny.store.dannystore.repository.ProductManufacturerRepository;
import danny.store.dannystore.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ProductService {
    @Autowired
    private ObjectMapper objectMapper;
    private final ProductRepository productRepository;
    private final ProductManufacturerRepository manufacturerRepository;
    private final ProductDetailRepository productDetailRepository;
    public List<ProductDto> getListProducts(Long productType, Long manufacturerId) {
        List<ProductDto> productDtos = new ArrayList<>();
        List<Product> products = new ArrayList<>();
        if (productType != null && manufacturerId != null && manufacturerId != 0L) {
            products = productRepository.getProductsByProductTypeAndManufacturerId(productType, manufacturerId);
        } else if (productType != null & manufacturerId == null){
            products = productRepository.getProductsByProductType(productType);
        } else if (manufacturerId == null){
            products = productRepository.findAll();
        } else {
            products = productRepository.findAll();
        }
        for (Product product : products) {
            ProductDto productDto = objectMapper.convertValue(product, ProductDto.class);
            productDtos.add(productDto);
        }
        return productDtos;
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
}
