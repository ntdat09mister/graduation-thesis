package danny.store.dannystore.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserInput {
    private String username;
    private String password;
    private String name;
    private String gender;
    private String address;
    private String phone;
    private String avatar;
}
