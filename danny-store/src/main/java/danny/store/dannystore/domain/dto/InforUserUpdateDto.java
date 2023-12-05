package danny.store.dannystore.domain.dto;

import lombok.Data;

@Data
public class InforUserUpdateDto {
    private Long userId;
    private String phone;
    private String address;
}
