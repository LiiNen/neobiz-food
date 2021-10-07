package kr.foodie.controller;

import java.util.List;
import java.util.Optional;

import kr.foodie.entity.ShopEntity;
import kr.foodie.repository.ShopRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/app/shop")
public class ShopController {
  private final ShopRepository shopRepository;

  @GetMapping("/all")
  public List<ShopEntity> findAllShop() {
    return shopRepository.findAll();
  }

  @GetMapping("/{id}")
  public Optional<ShopEntity> findById(@PathVariable int id) {
    return shopRepository.findById(id);
  }

  @GetMapping("/regionId/{id}")
  public List<ShopEntity> findByRegionId(@PathVariable int id) {
    return shopRepository.findByRegionId(id);
  }
  @GetMapping("/regionId/{id}/{type}")
  public List<ShopEntity> findByRegionIdAndShopType(@PathVariable int id, @PathVariable String type) {
    String shopType = type.equals("red") ? "0" : "1";
    return shopRepository.findByRegionIdAndShopType(id, shopType);
  }

  @GetMapping("/subwayId/{id}")
  public List<ShopEntity> findBySubwayTypeId(@PathVariable int id) {
    return shopRepository.findBySubwayTypeId(id);
  }
  @GetMapping("/subwayId/{id}/{type}")
  public List<ShopEntity> findBySubwayTypeIdAndShopType(@PathVariable int id, @PathVariable String type) {
    String shopType = type.equals("red") ? "0" : "1";
    return shopRepository.findByRegionIdAndShopType(id, shopType);
  }

  @GetMapping("/villageId/{id}")
  public List<ShopEntity> findByVillageTypeId(@PathVariable int id) {
    return shopRepository.findByVillageTypeId(id);
  }
  @GetMapping("/villageId/{id}/{type}")
  public List<ShopEntity> findByVillageTypeIdAndShopType(@PathVariable int id, @PathVariable String type) {
    String shopType = type.equals("red") ? "0" : "1";
    return shopRepository.findByRegionIdAndShopType(id, shopType);
  }
}
