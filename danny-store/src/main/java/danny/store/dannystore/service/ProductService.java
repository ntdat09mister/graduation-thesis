package danny.store.dannystore.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import danny.store.dannystore.domain.dto.ProdcutDto;
import danny.store.dannystore.domain.entity.Product;
import danny.store.dannystore.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {
    @Autowired
    private ObjectMapper objectMapper;
    private final ProductRepository productRepository;
    public List<ProdcutDto> getListProducts(Long productType) {
        List<ProdcutDto> prodcutDtos = new ArrayList<>();
        List<Product> products = productRepository.getListProducts(productType);
        for (Product product : products) {
            ProdcutDto productDto = objectMapper.convertValue(product, ProdcutDto.class);
            prodcutDtos.add(productDto);
        }
        return prodcutDtos;
    }
}
