package kr.foodie.entity;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity(name = "review")
public class ReviewEntity {
  @Id
  private Integer reviewId;
  @Column
  private String content;
  @Column
  private String createdAt;
  @Column
  private Integer shopId;
  @Column
  private Character starRating;
  @Column
  private Integer userId;
  @Column
  private String bestComment;
}
