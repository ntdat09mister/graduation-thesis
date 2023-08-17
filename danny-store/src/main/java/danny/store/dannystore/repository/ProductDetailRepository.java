package danny.store.dannystore.repository;

import danny.store.dannystore.domain.entity.ProductDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductDetailRepository extends JpaRepository<ProductDetail, Long> {
    List<ProductDetail> findByProductId(Long id);
}
