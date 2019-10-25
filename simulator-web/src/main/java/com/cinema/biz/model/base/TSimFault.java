package com.cinema.biz.model.base;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sim_fault")
public class TSimFault {
	@Id
    private String faultId;

    private String deviceId;

    private String faultDesc;

    private Date faultTime;

    private Date createTime;

    private String creator;

    private Date updateTime;

    private String updator;

    public String getFaultId() {
        return faultId;
    }

    public void setFaultId(String faultId) {
        this.faultId = faultId == null ? null : faultId.trim();
    }

    public String getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId == null ? null : deviceId.trim();
    }

    public String getFaultDesc() {
        return faultDesc;
    }

    public void setFaultDesc(String faultDesc) {
        this.faultDesc = faultDesc == null ? null : faultDesc.trim();
    }

    public Date getFaultTime() {
        return faultTime;
    }

    public void setFaultTime(Date faultTime) {
        this.faultTime = faultTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator == null ? null : creator.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdator() {
        return updator;
    }

    public void setUpdator(String updator) {
        this.updator = updator == null ? null : updator.trim();
    }

}