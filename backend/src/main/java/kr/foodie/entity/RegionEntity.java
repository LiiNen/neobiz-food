package kr.foodie.entity;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity(name = "region")
public class RegionEntity {
  @Id
  private Integer regionId;
  @Column
  private String provinceName;
  @Column
  private String districtName;
  @Column
  private String subwayName;
  @Column
  private Character regionType;
  @Column
  private Integer districtCount;
}
