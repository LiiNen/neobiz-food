package kr.foodie.repository;

import kr.foodie.entity.InquiryEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface InquiryRepository extends JpaRepository<InquiryEntity, Integer> {
  List<InquiryEntity> findByUserId(int userId);
}
