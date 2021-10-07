package kr.foodie.entity;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity(name = "favorite_shop")
public class FavoriteShopEntity {
  @Id
  private Integer id;
  @Column
  private Integer userId;
  @Column
  private Integer shopId;
  @Column
  private Date createdAt;
}