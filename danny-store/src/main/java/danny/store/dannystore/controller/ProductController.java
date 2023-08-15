package danny.store.dannystore.controller;

import danny.store.dannystore.domain.dto.ProdcutDto;
import danny.store.dannystore.domain.entity.ProductManufacturer;
import danny.store.dannystore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ProductController {
    @Autowired
    private ProductService productService;
    @GetMapping
    public List<ProdcutDto> getListProducts(@RequestParam(required = false) Long productType, @RequestParam(required = false) Long manufacturerId) {
        return productService.getListProducts(productType, manufacturerId);
    }
    @GetMapping("/manufacturer")
    public List<ProductManufacturer> getListProductManufacturers() {
        return productService.getListProductManufacturers();
    }
}
