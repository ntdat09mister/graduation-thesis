package danny.store.dannystore.repository;

import danny.store.dannystore.domain.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    @Query(value = "select * from product p where p.product_type = ?1 and p.manufacturer_id = ?2 and p.status = ?3", nativeQuery = true)
    List<Product> getProductsByProductTypeAndManufacturerId(Long productType, Long manufacturerId, Boolean status);
    @Query(value = "select * from product p where p.product_type = ?1 and p.status = ?2", nativeQuery = true)
    List<Product> getProductsByProductType(Long productType, Boolean status);
    @Query(value = "select * from product p where p.name like %?1%", nativeQuery = true)
    List<Product> searchProductDtosByName(String name);
    @Query(value = "select * from product p where p.status = ?1", nativeQuery = true)
    List<Product> findAllProducts(Boolean status);
}
