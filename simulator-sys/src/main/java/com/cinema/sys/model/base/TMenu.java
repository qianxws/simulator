package com.cinema.sys.model.base;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sys_menu")
public class TMenu {
	
	@Id
    private String menuid;

    private String name;

    private String code;

    private String pid;

    private Short cseq;

    private String url;

    private Short enabled;

    private Short isopen;

    private Date createtime;

    private String creator;

    private Date updatetime;

    private String updator;

    public String getMenuid() {
        return menuid;
    }

    public void setMenuid(String menuid) {
        this.menuid = menuid == null ? null : menuid.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid == null ? null : pid.trim();
    }

    public Short getCseq() {
        return cseq;
    }

    public void setCseq(Short cseq) {
        this.cseq = cseq;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Short getEnabled() {
        return enabled;
    }

    public void setEnabled(Short enabled) {
        this.enabled = enabled;
    }

    public Short getIsopen() {
        return isopen;
    }

    public void setIsopen(Short isopen) {
        this.isopen = isopen;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator == null ? null : creator.trim();
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getUpdator() {
        return updator;
    }

    public void setUpdator(String updator) {
        this.updator = updator == null ? null : updator.trim();
    }
}