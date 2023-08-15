package danny.store.dannystore.repository;

import danny.store.dannystore.domain.entity.ProductManufacturer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductManufacturerRepository extends JpaRepository<ProductManufacturer, Long> {
}
