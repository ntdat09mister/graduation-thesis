package danny.store.dannystore.service;

import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
@Service
public class PublicFunction {
    public String formatTime(Date dateInput) {
        if (dateInput!=null) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
            return simpleDateFormat.format(dateInput);
        } else {
            return "";
        }
    }
}
