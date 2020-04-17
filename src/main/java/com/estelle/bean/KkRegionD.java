package com.estelle.bean;

public class KkRegionD {
    private Double id;

    private String regionCode;

    private String regionName;

    private Double fid;

    private String regionNameEn;

    private String regionShortnameEn;

    private Byte level;

    public Double getId() {
        return id;
    }

    public void setId(Double id) {
        this.id = id;
    }

    public String getRegionCode() {
        return regionCode;
    }

    public void setRegionCode(String regionCode) {
        this.regionCode = regionCode == null ? null : regionCode.trim();
    }

    public String getRegionName() {
        return regionName;
    }

    public void setRegionName(String regionName) {
        this.regionName = regionName == null ? null : regionName.trim();
    }

    public Double getFid() {
        return fid;
    }

    public void setFid(Double fid) {
        this.fid = fid;
    }

    public String getRegionNameEn() {
        return regionNameEn;
    }

    public void setRegionNameEn(String regionNameEn) {
        this.regionNameEn = regionNameEn == null ? null : regionNameEn.trim();
    }

    public String getRegionShortnameEn() {
        return regionShortnameEn;
    }

    public void setRegionShortnameEn(String regionShortnameEn) {
        this.regionShortnameEn = regionShortnameEn == null ? null : regionShortnameEn.trim();
    }

    public Byte getLevel() {
        return level;
    }

    public void setLevel(Byte level) {
        this.level = level;
    }
}