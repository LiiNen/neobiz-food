package kr.foodie.controller;

import kr.foodie.VO.InquiryVO;
import kr.foodie.entity.InquiryEntity;
import kr.foodie.repository.InquiryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Calendar;
import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@RequestMapping("/app/inquiry")
public class InquiryController {
  private final InquiryRepository inquiryRepository;

  @GetMapping("/{id}")
  public Optional<InquiryEntity> findById(@PathVariable int id) {
    return inquiryRepository.findById(id);
  }

  @GetMapping("/user/{id}")
  public List<InquiryEntity> findByUserId(@PathVariable int id) {
    return inquiryRepository.findByUserId(id);
  }

  @PostMapping("/user/{id}")
  public String createInquiry(@PathVariable int id, @RequestBody InquiryVO inquiryVO) {
    inquiryRepository.save(InquiryEntity.builder()
            .userId(id)
            .userName(inquiryVO.getUserName())
            .title(inquiryVO.getTitle())
            .content(inquiryVO.getContent())
            .comment("")
            .createdAt(Calendar.getInstance().getTime())
            .modifiedAt(Calendar.getInstance().getTime()).build()
    );
    return "success";
  }
}
