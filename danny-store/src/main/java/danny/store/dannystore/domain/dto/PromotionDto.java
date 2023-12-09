package danny.store.dannystore.domain.dto;

import lombok.Data;

import java.util.Date;
@Data
public class PromotionDto {
    private Long id;
    private Long percentValue;
    private String namePromotion;
    private String descriptionPromotion;
    private Date startDayPromotion;
    private Date endDayPromotion;
}
