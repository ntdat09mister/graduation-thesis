package danny.store.dannystore.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import danny.store.dannystore.domain.dto.PromotionDto;
import danny.store.dannystore.domain.entity.Promotion;
import danny.store.dannystore.domain.entity.User;
import danny.store.dannystore.repository.PromotionRepository;
import danny.store.dannystore.repository.UserRepository;
import javassist.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.common.exceptions.UnauthorizedClientException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

import static danny.store.dannystore.common.Const.*;

@Service
@RequiredArgsConstructor
public class PromotionService {
    private final UserRepository userRepository;
    private final PromotionRepository promotionRepository;
    @Autowired
    private ObjectMapper objectMapper;
    public List<Promotion> getAllPromotions(Long userId) {
        Optional<User> userOptional = userRepository.findById(userId);
        if (userOptional.get().getRole().equals("admin") || userOptional.get().getRole().equals("sales") || userOptional.get().getRole().equals("warehouse")) {
            return promotionRepository.findAll();
        } else {
            return null;
        }
    }

    public String updatePromotion(Long userId, PromotionDto promotionDto) {
        Optional<User> userOptional = userRepository.findById(userId);
        if (userOptional.get().getRole().equals("admin") || userOptional.get().getRole().equals("sales") || userOptional.get().getRole().equals("warehouse")) {
            Optional<Promotion> promotionOptional = promotionRepository.findById(promotionDto.getId());
            if (promotionOptional.isPresent()) {
                Promotion promotion = promotionOptional.get();
                promotion.setPercentValue(promotionDto.getPercentValue());
                promotion.setDescriptionPromotion(promotionDto.getDescriptionPromotion());
                promotion.setNamePromotion(promotionDto.getNamePromotion());
                promotion.setStartDayPromotion(promotionDto.getStartDayPromotion());
                promotion.setEndDayPromotion(promotionDto.getEndDayPromotion());
                promotionRepository.save(promotion);
                return "update success!";
            }
        } else {
            throw new UnauthorizedClientException(RESPONSE_UNAUTHORIZED);
        }
        return null;
    }

    public String createPromotion(Long userId, PromotionDto promotionDto) {
        Optional<User> userOptional = userRepository.findById(userId);
        if (userOptional.get().getRole().equals("admin") || userOptional.get().getRole().equals("sales") || userOptional.get().getRole().equals("warehouse")) {
            Promotion promotion = new Promotion();
            promotion.setNamePromotion(promotionDto.getNamePromotion());
            promotion.setPercentValue(promotion.getPercentValue());
            promotion.setDescriptionPromotion(promotionDto.getDescriptionPromotion());
            promotion.setStartDayPromotion(promotionDto.getStartDayPromotion());
            promotion.setEndDayPromotion(promotionDto.getEndDayPromotion());
            promotionRepository.save(promotion);
            return RESPONSE_ADD_SUCCESS;
        } else {
            throw new UnauthorizedClientException(RESPONSE_UNAUTHORIZED);
        }
    }

    public String deletePromotion(Long id, Long promotionId) throws NotFoundException {
        Optional<User> userOptional = userRepository.findById(id);
        if (userOptional.get().getRole().equals("admin") || userOptional.get().getRole().equals("sales")) {
            Optional<Promotion> promotionOptional = promotionRepository.findById(promotionId);
            if (promotionOptional.isPresent()) {
                Promotion promotion = promotionOptional.get();
                promotionRepository.delete(promotion);
                return "Delete promotion" + promotionId;
            } else {
                throw new NotFoundException(RESPONSE_NOT_FOUND);
            }
        } else {
            throw new NotFoundException(RESPONSE_UNAUTHORIZED);
        }
    }
}
