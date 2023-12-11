package danny.store.dannystore.repository;

import danny.store.dannystore.domain.entity.CartDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    List<CartDetail> findByCartId(Long id);
    @Transactional
    @Modifying
    @Query(value = "delete from cart_detail where cart_id = ?1 ", nativeQuery = true)
    void deleteByCartId(Long cartId);
}
