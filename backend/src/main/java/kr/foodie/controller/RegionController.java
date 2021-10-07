package kr.foodie.controller;

import kr.foodie.entity.RegionEntity;
import kr.foodie.repository.RegionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/app/region")
public class RegionController {
  private final RegionRepository regionRepository;

  @GetMapping("/town")
  public List<RegionEntity> showTownList() {
    return regionRepository.findByRegionType(3);
  }

  //TODO: 수도권/비수도권/수인분당선 등 예외처리 할거많다
  @GetMapping("/subway/{line}")
  public List<RegionEntity> showSubwayLineList(@PathVariable int line) {
    String subwayLine = Integer.toString(line) + "호선";
    return regionRepository.findByDistrictName(subwayLine);
  }
}
