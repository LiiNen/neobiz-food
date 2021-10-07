package kr.foodie.controller;

import kr.foodie.entity.ReviewEntity;
import kr.foodie.repository.ReviewRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/app/review")
public class ReviewController {
  private final ReviewRepository reviewRepository;

  @GetMapping("/userId/{id}")
  public List<ReviewEntity> findByUserId(@PathVariable int id) {
    return reviewRepository.findByUserIdOrderByCreatedAtDesc(id);
  }

  @GetMapping("/shopId/{id}")
  public List<ReviewEntity> findByShopId(@PathVariable int id) {
    return reviewRepository.findByShopIdOrderByCreatedAtDesc(id);
  }
}
