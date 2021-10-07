package kr.foodie.repository;

import kr.foodie.entity.ReviewEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReviewRepository extends JpaRepository<ReviewEntity, Integer> {
  List<ReviewEntity> findByUserIdOrderByCreatedAtDesc(int userId);
  List<ReviewEntity> findByShopIdOrderByCreatedAtDesc(int shopId);
}
