package danny.store.dannystore.repository;

import danny.store.dannystore.domain.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
    @Query(value = "select * from `role` r where r.role_name = ?1", nativeQuery = true)
    Optional<Role> findByRoleName(String roleName);
}
