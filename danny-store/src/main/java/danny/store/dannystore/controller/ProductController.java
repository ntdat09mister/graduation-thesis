package danny.store.dannystore.controller;

import danny.store.dannystore.domain.dto.ProductDto;
import danny.store.dannystore.domain.entity.ProductDetail;
import danny.store.dannystore.domain.entity.ProductManufacturer;
import danny.store.dannystore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ProductController {
    @Autowired
    private ProductService productService;
    @GetMapping
    public List<ProductDto> getListProducts(@RequestParam(required = false) Long productType, @RequestParam(required = false) Long manufacturerId) {
        return productService.getListProducts(productType, manufacturerId);
    }
    @GetMapping("/manufacturer")
    public List<ProductManufacturer> getListProductManufacturers() {
        return productService.getListProductManufacturers();
    }
    @GetMapping("/detail/{productId}")
    public List<ProductDetail> getProductImgDetail(@PathVariable Long productId) {
        return productService.getProductImgDetail(productId);
    }
    @GetMapping("/{id}")
    public ProductDto getProductDtoById(@PathVariable Long id) throws ClassNotFoundException {
        return productService.getProductDtoById(id);
    }
    @GetMapping("/search")
    public List<ProductDto> searchProductDtosByName(@RequestParam String name) {
        return productService.searchProductDtosByName(name);
    }
}
