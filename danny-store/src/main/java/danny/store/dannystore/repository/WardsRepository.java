package danny.store.dannystore.repository;

import danny.store.dannystore.domain.entity.Wards;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WardsRepository extends JpaRepository<Wards, Long> {
    @Query(value = "select * from wards w where w.district_id = ?1", nativeQuery = true)
    List<Wards> wardsRepository(Long districtId);
}
