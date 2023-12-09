package danny.store.dannystore.domain.dto;

import lombok.Data;

import java.util.Date;

@Data
public class UserAdminDto {
    private Long id;
    private String username;
    private String name;
    private String gender;
    private String address;
    private String phone;
    private String role;
    private Boolean active;
    private String createdAt;
}
