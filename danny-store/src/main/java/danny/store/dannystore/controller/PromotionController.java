package danny.store.dannystore.controller;

import danny.store.dannystore.domain.entity.User;
import danny.store.dannystore.resolver.UserInfo;
import danny.store.dannystore.service.PromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
