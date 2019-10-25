package com.cinema.biz.model.base;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sim_duty_task")
public class TSimDutyTask {
	@Id
    private String dutyTaskId;

    private String name;

    private String trainGround;

    private String trainContent;

    private Boolean isExec;

    private String station;

    private String watchman;

    private Date createTime;

    private String creator;

    private Date updateTime;

    private String updator;

    public String getDutyTaskId() {
        return dutyTaskId;
    }

    public void setDutyTaskId(String dutyTaskId) {
        this.dutyTaskId = dutyTaskId == null ? null : dutyTaskId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTrainGround() {
        return trainGround;
    }

    public void setTrainGround(String trainGround) {
        this.trainGround = trainGround == null ? null : trainGround.trim();
    }

    public String getTrainContent() {
        return trainContent;
    }

    public void setTrainContent(String trainContent) {
        this.trainContent = trainContent == null ? null : trainContent.trim();
    }

    public Boolean getIsExec() {
        return isExec;
    }

    public void setIsExec(Boolean isExec) {
        this.isExec = isExec;
    }

    public String getStation() {
        return station;
    }

    public void setStation(String station) {
        this.station = station == null ? null : station.trim();
    }

    public String getWatchman() {
        return watchman;
    }

    public void setWatchman(String watchman) {
        this.watchman = watchman == null ? null : watchman.trim();
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