package danny.store.dannystore.domain.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserOutput {
    private Long id;
    private String username;
    private String name;
    private String gender;
    private String address;
    private String phone;
    private String role;
    private String avatar;
    private Integer active;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;
}