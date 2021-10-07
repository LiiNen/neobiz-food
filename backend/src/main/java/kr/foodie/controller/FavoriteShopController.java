package kr.foodie.controller;

import kr.foodie.entity.FavoriteShopEntity;
import kr.foodie.repository.FavoriteShopRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/app/favoriteShop")
public class FavoriteShopController {
  private final FavoriteShopRepository favoriteShopRepository;

  // 최신순으로 return
  @GetMapping("/user/{id}")
  public List<FavoriteShopEntity> findByUserId(@PathVariable int id) {
    return favoriteShopRepository.findByUserIdOrderByCreatedAtDesc(id);
  }

  @GetMapping("/shop/{id}")
  public List<FavoriteShopEntity> findByShopId(@PathVariable int id) {
    return favoriteShopRepository.findByShopId(id);
  }
}
