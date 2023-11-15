package danny.store.dannystore.controller;

import danny.store.dannystore.domain.dto.ProductDto;
import danny.store.dannystore.domain.dto.ProductDtoForAdmin;
import danny.store.dannystore.domain.entity.User;
import danny.store.dannystore.resolver.UserInfo;
import danny.store.dannystore.service.ProductService;
import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/product")
public class ProductController extends BaseController {
    @Autowired
    private ProductService productService;

    @GetMapping
    public ResponseEntity<?> getListProducts(@RequestParam(required = false) Long productType, @RequestParam(required = false) Long manufacturerId) throws NotFoundException {
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

    @PreAuthorize("hasAnyAuthority('warehouse','admin')")
    @GetMapping("admin/all")
    public ResponseEntity<?> getListProductsAdmin(@UserInfo User user) throws NotFoundException {
        return successResponse(productService.getListProductsAdmin(user.getId()));
    }

    @PreAuthorize("hasAnyAuthority('warehouse','admin')")
    @PutMapping("admin/updateStatus")
    public ResponseEntity<?> updateStatusProduct(@UserInfo User user, @RequestParam Long productId) throws NotFoundException {
        return successResponse(productService.updateStatusProduct(user.getId(), productId));
    }
    @PreAuthorize("hasAnyAuthority('warehouse','admin')")
    @PutMapping("admin/updateProduct")
    public ResponseEntity<?> updateProduct(@UserInfo User user, @RequestBody ProductDtoForAdmin productDtoForAdmin) throws NotFoundException {
        return successResponse(productService.updateProduct(user.getId(), productDtoForAdmin));
    }
}
