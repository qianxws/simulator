package com.cinema.biz.model.base;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sim_duty_reg")
public class TSimDutyReg {
	@Id
    private String dutyRegId;

    private String dutyTaskId;

    private String dutyContent;

    private String faultReg;

    private String repairReg;

    private Date createTime;

    private String creator;

    private Date updateTime;

    private String updator;

    public String getDutyRegId() {
        return dutyRegId;
    }

    public void setDutyRegId(String dutyRegId) {
        this.dutyRegId = dutyRegId == null ? null : dutyRegId.trim();
    }

    public String getDutyTaskId() {
        return dutyTaskId;
    }

    public void setDutyTaskId(String dutyTaskId) {
        this.dutyTaskId = dutyTaskId == null ? null : dutyTaskId.trim();
    }

    public String getDutyContent() {
        return dutyContent;
    }

    public void setDutyContent(String dutyContent) {
        this.dutyContent = dutyContent == null ? null : dutyContent.trim();
    }

    public String getFaultReg() {
        return faultReg;
    }

    public void setFaultReg(String faultReg) {
        this.faultReg = faultReg == null ? null : faultReg.trim();
    }

    public String getRepairReg() {
        return repairReg;
    }

    public void setRepairReg(String repairReg) {
        this.repairReg = repairReg == null ? null : repairReg.trim();
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