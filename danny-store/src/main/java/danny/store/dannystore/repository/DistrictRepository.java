package danny.store.dannystore.repository;

import danny.store.dannystore.domain.entity.District;
import danny.store.dannystore.domain.entity.Wards;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DistrictRepository extends JpaRepository<District, Long> {
    @Query(value = "select * from district d where d.province_id = ?1", nativeQuery = true)
    List<District> getListDistrictOfProvince(Long provinceId);
}
