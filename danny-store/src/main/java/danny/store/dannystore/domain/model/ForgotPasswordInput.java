package danny.store.dannystore.domain.model;

import lombok.Data;

@Data
public class ForgotPasswordInput {
    private String username;
    private String phoneNumber;
}
