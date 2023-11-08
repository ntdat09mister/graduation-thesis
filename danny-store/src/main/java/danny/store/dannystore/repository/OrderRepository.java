package danny.store.dannystore.repository;

import danny.store.dannystore.domain.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByCustomerId(Long userId);
    @Query(value = "SELECT * FROM `order` o WHERE DATE(o.created_at) = ?1", nativeQuery = true)
    List<Order> filterByDay(String filterTime);
    @Query(value = "SELECT SUM(o.total_amount)  FROM `order` o WHERE DATE(o.created_at) = ?1", nativeQuery = true)
    Float totalAmountByDay(String filterTime);
    @Query(value = "SELECT * FROM `order` o WHERE YEAR(o.created_at) = ?1 AND MONTH(o.created_at) = ?2", nativeQuery = true)
    List<Order> filterByMonth(Long valueYear, Long valueMonth);
    @Query(value = "SELECT SUM(o.total_amount)  FROM `order` o WHERE YEAR(o.created_at) = ?1 AND MONTH(o.created_at) = ?2", nativeQuery = true)
    Float totalAmountByMonth(Long valueYear, Long valueMonth);
    @Query(value = "SELECT * FROM `order` o WHERE YEAR(o.created_at) = ?1", nativeQuery = true)
    List<Order> filterByYear(String filterTime);
    Optional<Order> findByIdAndCustomerId(Long orderId, Long userId);
    @Query(value = "SELECT SUM(o.total_amount) FROM `order` o WHERE YEAR(o.created_at) = ?1", nativeQuery = true)
    Float totalAmountByYear(String filterTime);
}