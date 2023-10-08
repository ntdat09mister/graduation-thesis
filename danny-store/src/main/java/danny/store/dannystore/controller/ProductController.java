package danny.store.dannystore.controller;

import danny.store.dannystore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/product")
public class ProductController extends BaseController{
    @Autowired
    private ProductService productService;
    @GetMapping
    public ResponseEntity<?> getListProducts(@RequestParam(required = false) Long productType, @RequestParam(required = false) Long manufacturerId) {
        return successResponse(productService.getListProducts(productType, manufacturerId));
    }
    @GetMapping("/manufacturer")
    public ResponseEntity<?> getListProductManufacturers() {
        return successResponse(productService.getListProductManufacturers());
    }
    @GetMapping("/detail/{productId}")
    public ResponseEntity<?> getProductImgDetail(@PathVariable Long productId) {
        return successResponse(productService.getProductImgDetail(productId));
    }
    @GetMapping("/{id}")
    public ResponseEntity<?> getProductDtoById(@PathVariable Long id) throws ClassNotFoundException {
        return successResponse(productService.getProductDtoById(id));
    }
    @GetMapping("/search")
    public ResponseEntity<?> searchProductDtosByName(@RequestParam String name) {
        return successResponse(productService.searchProductDtosByName(name));
    }
}
