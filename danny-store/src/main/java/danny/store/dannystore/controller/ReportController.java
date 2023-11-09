package danny.store.dannystore.controller;

import danny.store.dannystore.service.OrderService;
import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/report")
public class ReportController extends BaseController{
    @Autowired
    private OrderService orderService;
    @GetMapping
    public ResponseEntity<?> filterReport(@RequestParam(required = false) Long byDay, @RequestParam(required = false) Long byMonth, @RequestParam(required = false) Long byYear) throws NotFoundException {
        return successResponse(orderService.filterReport(byDay, byMonth, byYear));
    }
}