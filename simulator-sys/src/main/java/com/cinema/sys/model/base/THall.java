package com.cinema.sys.model.base;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sys_hall")
public class THall {
	@Id
    private String hallId;

    private String hallTypeId;

    private String cinemaId;

    private String name;

    private Short hallNum;

    private Short seats;

    private String creator;

    private Date createTime;

    private String hallCode;

    public String getHallId() {
        return hallId;
    }

    public void setHallId(String hallId) {
        this.hallId = hallId == null ? null : hallId.trim();
    }

    public String getHallTypeId() {
        return hallTypeId;
    }

    public void setHallTypeId(String hallTypeId) {
        this.hallTypeId = hallTypeId == null ? null : hallTypeId.trim();
    }

    public String getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(String cinemaId) {
        this.cinemaId = cinemaId == null ? null : cinemaId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Short getHallNum() {
        return hallNum;
    }

    public void setHallNum(Short hallNum) {
        this.hallNum = hallNum;
    }

    public Short getSeats() {
        return seats;
    }

    public void setSeats(Short seats) {
        this.seats = seats;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator == null ? null : creator.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getHallCode() {
        return hallCode;
    }

    public void setHallCode(String hallCode) {
        this.hallCode = hallCode == null ? null : hallCode.trim();
    }
}