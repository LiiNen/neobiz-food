package kr.foodie.repository;

import kr.foodie.entity.FavoriteShopEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FavoriteShopRepository extends JpaRepository<FavoriteShopEntity, Integer> {
  List<FavoriteShopEntity> findByUserIdOrderByCreatedAtDesc(int userId);
  List<FavoriteShopEntity> findByShopId(int shopId);
}
