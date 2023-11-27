package danny.store.dannystore.repository;

import danny.store.dannystore.domain.entity.CartDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    CartDetail findByCartId(Long id);
    void deleteByCartId(Long cartId);
}
