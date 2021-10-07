package kr.foodie.repository;

import kr.foodie.entity.ShopEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShopRepository extends JpaRepository<ShopEntity, Integer> {
  List<ShopEntity> findByRegionId(int regionId);
  List<ShopEntity> findByRegionIdAndShopType(int regionId, String shopType);
  List<ShopEntity> findBySubwayTypeId(int subwayTypeId);
  List<ShopEntity> findBySubwayTypeIdAndShopType(int subwayTypeId, String shopType);
  List<ShopEntity> findByVillageTypeId(int villageTypeId);
  List<ShopEntity> findByVillageTypeIdAndShopType(int villageTypeId, String shopType);
}
