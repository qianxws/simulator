package com.cinema.sys.model.base;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sys_role_hall")
public class TRoleHall {
	
	@Id
    private String refId;

    private String cinemaId;

    private String provinceId;

    private String cityId;

    private String roleId;

    private String hallId;

    public String getRefId() {
        return refId;
    }

    public void setRefId(String refId) {
        this.refId = refId == null ? null : refId.trim();
    }

    public String getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(String cinemaId) {
        this.cinemaId = cinemaId == null ? null : cinemaId.trim();
    }

    public String getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(String provinceId) {
        this.provinceId = provinceId == null ? null : provinceId.trim();
    }

    public String getCityId() {
        return cityId;
    }

    public void setCityId(String cityId) {
        this.cityId = cityId == null ? null : cityId.trim();
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    public String getHallId() {
        return hallId;
    }

    public void setHallId(String hallId) {
        this.hallId = hallId == null ? null : hallId.trim();
    }
}