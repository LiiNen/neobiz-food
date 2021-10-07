package kr.foodie.entity;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity(name = "inquiry")
public class InquiryEntity {
  @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer inquiryId;
  @Column
  private String comment;
  @Column
  private String content;
  @Column
  private Date createdAt;
  @Column
  private Date modifiedAt;
  @Column
  private String title;
  @Column
  private Integer userId;
  @Column
  private String userName;

  @Builder
  public InquiryEntity(Integer userId, String title, String userName, String content, String comment, Date createdAt, Date modifiedAt) {
    this.userId = userId;
    this.title = title;
    this.userName = userName;
    this.content = content;
    this.comment = comment;
    this.createdAt = createdAt;
    this.modifiedAt = modifiedAt;
  }
}
