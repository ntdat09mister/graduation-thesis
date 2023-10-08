package danny.store.dannystore.controller;

import danny.store.dannystore.domain.message.BaseMessage;
import danny.store.dannystore.domain.message.ExtendedMessage;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class BaseController {
    /**
     * Create a default succeeded message return object with plain text message and payload
     * @param message Success or error message
     * @param data Payload
     * @return ExtendedMessage
     * @param <T> Object data
     */
    public <T> ResponseEntity<?> successResponse(String message, T data) {
        ExtendedMessage<T> responseMessage =  new ExtendedMessage<>(
                HttpStatus.OK.value() + "",
                true,
                message,
                data);
        return new ResponseEntity<>(responseMessage, HttpStatus.OK);
    }

    /**
     * Create a default succeeded message return object with plain text message
     * @param message Success or error message
     * @return ExtendedMessage
     */
    public ResponseEntity<?> successResponse(String message) {
        return successResponse(message, null);
    }

    /**
     * Create a default succeeded message return object with payload
     * @param data Payload
     * @return ExtendedMessage
     * @param <T> Object data
     */
    public <T> ResponseEntity<?> successResponse(T data) {
        return successResponse(null, data);
    }

    /**
     *  Create a default failed message return object
     * @param code Http status code
     * @param message Plain text display error
     * @return BaseMessage
     */
    public ResponseEntity<?> failedResponse(String code, String message) {
        String prefix = "[User Service]";
        BaseMessage responseMessage = new BaseMessage(code, false, String.format("%s %s", prefix, message));
        return new ResponseEntity<>(responseMessage, HttpStatus.valueOf(Integer.parseInt(code)));
    }
}
