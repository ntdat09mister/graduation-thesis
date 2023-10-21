package danny.store.dannystore.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class ControllerExceptionHandler extends BaseController {
    @ExceptionHandler({ MethodArgumentNotValidException.class })
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ResponseEntity<?> handleException(MethodArgumentNotValidException e) {
        return failedResponse(
                HttpStatus.BAD_REQUEST.value() + "",
                e.getMessage(),
                null);
    }

    @ExceptionHandler({ IllegalArgumentException.class })
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ResponseEntity<?> handleException(IllegalArgumentException e) {
        return failedResponse(
                HttpStatus.BAD_REQUEST.value() + "",
                e.getMessage(),
                null);
    }

    @ExceptionHandler({ Exception.class })
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ResponseEntity<?> handleException(Exception e) {
        return failedResponse(
                HttpStatus.INTERNAL_SERVER_ERROR.value() + "",
                e.getMessage(),
                null);
    }
}