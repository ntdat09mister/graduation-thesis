package danny.store.dannystore.repository;

import danny.store.dannystore.domain.entity.Province;
import lombok.Value;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProvinceRepository extends JpaRepository<Province, Long> {
    @Query(value = "select p.name from province p where p.province_id = ?1", nativeQuery = true)
    String getProvince(Long provinceId);
}
