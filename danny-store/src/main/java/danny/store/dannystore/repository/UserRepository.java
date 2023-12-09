package danny.store.dannystore.repository;

import danny.store.dannystore.domain.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);

    boolean existsByUsername(String username);
    @Query(value = "select u.active from user u WHERE u.username = ?1", nativeQuery = true)
    Boolean getActiveUser(String username);
    @Query(value = "select * from user u where u.username = ?1 and u.phone = ?2", nativeQuery = true)
    Optional<User> findByUsernameAndPhoneNumber(String username, String phoneNumber);
}

