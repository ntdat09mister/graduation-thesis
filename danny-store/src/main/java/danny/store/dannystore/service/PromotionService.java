package danny.store.dannystore.service;

import danny.store.dannystore.domain.entity.Promotion;
import danny.store.dannystore.domain.entity.User;
import danny.store.dannystore.repository.PromotionRepository;
import danny.store.dannystore.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class PromotionService {
    private final UserRepository userRepository;
    private final PromotionRepository promotionRepository;
    public List<Promotion> getAllPromotions(Long userId) {
        Optional<User> userOptional = userRepository.findById(userId);
        if (userOptional.get().getRole().equals("admin") || userOptional.get().getRole().equals("sales") || userOptional.get().getRole().equals("warehouse")) {
            return promotionRepository.findAll();
        } else {
            return null;
        }
    }
}
