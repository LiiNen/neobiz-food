package kr.foodie.repository;

import kr.foodie.entity.RegionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RegionRepository extends JpaRepository<RegionEntity, Integer> {
  List<RegionEntity> findByRegionType(int regionType);
  List<RegionEntity> findByDistrictName(String districtName);
}
