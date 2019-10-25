package com.cinema.biz.model.base;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sim_type")
public class TSimType {
	@Id
    private String typeId;

    private String name;

    private Integer cseq;

    private Date createTime;

    private String creator;

    private Date updateTime;

    private String updator;

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId == null ? null : typeId.trim();
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