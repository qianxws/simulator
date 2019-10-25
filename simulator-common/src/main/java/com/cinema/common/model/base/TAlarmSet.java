package com.cinema.common.model.base;

import java.util.Date;

import javax.persistence.Table;


public class TAlarmSet {
    private String alarmSetId;

    private String setType;

    private String setName;

    private String setCode;

    private Double setValue;

    private Date lastModifyTime;

    private String lastModifyUser;

    private String code;

    public String getAlarmSetId() {
        return alarmSetId;
    }

    public void setAlarmSetId(String alarmSetId) {
        this.alarmSetId = alarmSetId == null ? null : alarmSetId.trim();
    }

    public String getSetType() {
        return setType;
    }

    public void setSetType(String setType) {
        this.setType = setType == null ? null : setType.trim();
    }

    public String getSetName() {
        return setName;
    }

    public void setSetName(String setName) {
        this.setName = setName == null ? null : setName.trim();
    }

    public String getSetCode() {
        return setCode;
    }

    public void setSetCode(String setCode) {
        this.setCode = setCode == null ? null : setCode.trim();
    }

    public Double getSetValue() {
        return setValue;
    }

    public void setSetValue(Double setValue) {
        this.setValue = setValue;
    }

    public Date getLastModifyTime() {
        return lastModifyTime;
    }

    public void setLastModifyTime(Date lastModifyTime) {
        this.lastModifyTime = lastModifyTime;
    }

    public String getLastModifyUser() {
        return lastModifyUser;
    }

    public void setLastModifyUser(String lastModifyUser) {
        this.lastModifyUser = lastModifyUser == null ? null : lastModifyUser.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }
}