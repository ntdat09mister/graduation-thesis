package danny.store.dannystore.service;

import danny.store.dannystore.domain.entity.StatusOrder;
import danny.store.dannystore.repository.StatusOrderRepository;
import javassist.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import static danny.store.dannystore.common.Const.RESPONSE_NOT_FOUND;

@Service
@RequiredArgsConstructor
public class PublicFunction {
    private final StatusOrderRepository statusOrderRepository;
    public String formatTime(Date dateInput) {
        if (dateInput != null) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
            System.out.println("Convert value Date to String");
            return simpleDateFormat.format(dateInput);
        } else {
            return "";
        }
    }
    public String formatTimeDetail(Date dateInput) {
        if (dateInput != null) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            System.out.println("Convert value Date to String");
            return simpleDateFormat.format(dateInput);
        } else {
            return "";
        }
    }
    public Long getDay(Date dateInput) {
        if (dateInput != null) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd");
            Long value = Long.valueOf(simpleDateFormat.format(dateInput));
            System.out.println("getMonth from value" + dateInput);
            return value;
        } else {
            throw new RuntimeException(RESPONSE_NOT_FOUND);
        }
    }
    public Long getMonth(Date dateInput) {
        if (dateInput != null) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM");
            Long value = Long.valueOf(simpleDateFormat.format(dateInput));
            System.out.println("getMonth from value" + dateInput);
            return value;
        } else {
            throw new RuntimeException(RESPONSE_NOT_FOUND);
        }
    }
    public Long getYear(Date dateInput) {
        if (dateInput != null) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
            Long value = Long.valueOf(simpleDateFormat.format(dateInput));
            System.out.println("getMonth from value" + dateInput);
            return value;
        } else {
            throw new RuntimeException(RESPONSE_NOT_FOUND);
        }
    }
    public String getStatus(Long statusId) throws NotFoundException {
        Optional<StatusOrder> statusOrderOptional = statusOrderRepository.findById(statusId);
        if (statusOrderOptional.isPresent()) {
            return statusOrderOptional.get().getStatusName();
        } else {
            throw new NotFoundException(RESPONSE_NOT_FOUND);
        }
    }
    public String getTimeFilter(Date dateInput) {
        if (dateInput != null) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            System.out.println("Convert value Date to String");
            return simpleDateFormat.format(dateInput);
        } else {
            return "";
        }
    }
}