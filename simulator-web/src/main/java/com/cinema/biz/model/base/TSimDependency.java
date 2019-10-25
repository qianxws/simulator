package com.cinema.biz.model.base;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sim_dependency")
public class TSimDependency {
	@Id
    private String dependencyId;

    private String name;

    private Integer runOrder;

    private Date createTime;

    private String creator;

    private Date updateTime;

    private String updator;

    public String getDependencyId() {
        return dependencyId;
    }

    public void setDependencyId(String dependencyId) {
        this.dependencyId = dependencyId == null ? null : dependencyId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getRunOrder() {
        return runOrder;
    }

    public void setRunOrder(Integer runOrder) {
        this.runOrder = runOrder;
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