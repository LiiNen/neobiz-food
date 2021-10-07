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
@Entity(name = "shop")
public class ShopEntity {
  @Id
  private Integer shopId;
  @Column
  private Integer regionId;
  @Column
  private Integer subwayTypeId;
  @Column
  private Integer villageTypeId;
  @Column
  private String bigCategory;
  @Column
  private String middleCategory;
  @Column
  private String smallCategory;
  @Column
  private String shopType;
  @Column
  private Character shopPaid;
  @Column
  private Date premiumRegisterDate;
  @Column
  private String shopName;
  @Column
  private String shopAlias;
  @Column
  private String address;
  @Column
  private String detailAddress;
  @Column
  private String phone;
  @Column
  private String operationTime;
  @Column
  private String holiday;
  @Column
  private String recommandMenu;
  @Column
  private String isReservation;
  @Column
  private String isParking;
  @Column
  private String budget;
  @Column
  private String homepage;
  @Column
  private String history;
  @Column
  private String menu;
  @Column
  private String shopImage;
  @Column
  private String menuImages;
  @Column
  private String foodielogRating;
  @Column
  private String themeList;
  @Column
  private Integer area_1st;
  @Column
  private Integer area_2nd;
  @Column
  private Integer area_3th;
  @Column
  private String areaEtc;
}