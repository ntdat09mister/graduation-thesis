package danny.store.dannystore.repository;

import danny.store.dannystore.domain.entity.StatusOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StatusOrderRepository extends JpaRepository<StatusOrder, Long> {
}
