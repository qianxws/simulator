package com.cinema.biz.model.base;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sim_simulator")
public class TSimSimulator {
	@Id
    private String simulatorId;

    private String parentId;

    private String name;

    private Integer cseq;

    private Boolean enabled;

    private Boolean isopen;

    private Date createTime;

    private String creator;

    private Date updateTime;

    private String updator;

    public String getSimulatorId() {
        return simulatorId;
    }

    public void setSimulatorId(String simulatorId) {
        this.simulatorId = simulatorId == null ? null : simulatorId.trim();
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getCseq() {
        return cseq;
    }

    public void setCseq(Integer cseq) {
        this.cseq = cseq;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public Boolean getIsopen() {
        return isopen;
    }

    public void setIsopen(Boolean isopen) {
        this.isopen = isopen;
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