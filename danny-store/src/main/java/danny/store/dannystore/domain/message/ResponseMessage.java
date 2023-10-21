package danny.store.dannystore.domain.message;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ResponseMessage<T> extends BaseMessage implements Serializable {
    private T data;

    public ResponseMessage(String code, boolean success, String message, String description, T data) {
        super(code, success, message, description);
        this.data = data;
    }
}