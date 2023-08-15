package danny.store.dannystore.controller;

import danny.store.dannystore.domain.dto.ProdcutDto;
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
    public List<ProdcutDto> getListProducts(@RequestParam Long productType) {
        return productService.getListProducts(productType);
    }
}
