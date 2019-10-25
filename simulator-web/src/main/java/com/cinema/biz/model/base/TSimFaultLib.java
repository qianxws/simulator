package com.cinema.biz.model.base;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sim_fault_lib")
public class TSimFaultLib {
	@Id
    private String faultLibId;

    private String typeId;

    private String deviceName;

    private String faultName;

    private String faultContent;

    private String faultPlan;

    private Date createTime;

    private String creator;

    private Date updateTime;

    private String updator;

    public String getFaultLibId() {
        return faultLibId;
    }

    public void setFaultLibId(String faultLibId) {
        this.faultLibId = faultLibId == null ? null : faultLibId.trim();
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId == null ? null : typeId.trim();
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName == null ? null : deviceName.trim();
    }

    public String getFaultName() {
        return faultName;
    }

    public void setFaultName(String faultName) {
        this.faultName = faultName == null ? null : faultName.trim();
    }

    public String getFaultContent() {
        return faultContent;
    }

    public void setFaultContent(String faultContent) {
        this.faultContent = faultContent == null ? null : faultContent.trim();
    }

    public String getFaultPlan() {
        return faultPlan;
    }

    public void setFaultPlan(String faultPlan) {
        this.faultPlan = faultPlan == null ? null : faultPlan.trim();
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