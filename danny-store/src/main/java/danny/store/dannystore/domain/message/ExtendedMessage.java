package danny.store.dannystore.domain.message;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class ExtendedMessage<T> extends BaseMessage {
    private T data;

    public ExtendedMessage(String code, Boolean success, String message, T data) {
        super(code, success, message);
        this.data = data;
    }

    public ExtendedMessage(String code, Boolean success, String message) {
        super(code, success, message);
    }
}
