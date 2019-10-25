package com.cinema.biz.model.base;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sim_operate")
public class TSimOperate {
	@Id
    private String operateId;

    private String deviceId;

    private String operate;

    private Date operateTime;

    private Date startTime;

    private Date endTime;

    private Date softStartTime;

    public String getOperateId() {
        return operateId;
    }

    public void setOperateId(String operateId) {
        this.operateId = operateId == null ? null : operateId.trim();
    }

    public String getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId == null ? null : deviceId.trim();
    }

    public String getOperate() {
        return operate;
    }

    public void setOperate(String operate) {
        this.operate = operate == null ? null : operate.trim();
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getSoftStartTime() {
        return softStartTime;
    }

    public void setSoftStartTime(Date softStartTime) {
        this.softStartTime = softStartTime;
    }

}