package danny.store.dannystore.controller;

import danny.store.dannystore.domain.dto.PromotionDto;
import danny.store.dannystore.domain.entity.User;
import danny.store.dannystore.resolver.UserInfo;
import danny.store.dannystore.service.PromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/promotion")
public class PromotionController extends BaseController{
    @Autowired
    private PromotionService promotionService;
    @PreAuthorize("hasAnyAuthority('warehouse','admin','sales')")
    @GetMapping
    public ResponseEntity<?> getAllPromotions(@UserInfo User user) {
        return successResponse(promotionService.getAllPromotions(user.getId()));
    }
    @PreAuthorize("hasAnyAuthority('warehouse','admin','sales')")
    @PutMapping
    public ResponseEntity<?> updatePromotion(@UserInfo User user, @RequestBody PromotionDto promotionDto) {
        return successResponse(promotionService.updatePromotion(user.getId(), promotionDto));
    }
    @PreAuthorize("hasAnyAuthority('warehouse','admin','sales')")
    @PostMapping
    public ResponseEntity<?> createPromotion(@UserInfo User user, @RequestBody PromotionDto promotionDto) {
        return successResponse(promotionService.createPromotion(user.getId(), promotionDto));
    }
}
