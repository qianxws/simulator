package com.cinema.common.model.base;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="test_ftfc")
public class TFtfc {
	@Id
    private String ftfcId;

    private String hallId;

    private String filmId;

    private Date playTime;

    private long reportPeoples;

    private long verifyPeoples;

    private Double ticketOffice;

    private Date createTime;

    private Integer isException;

    private String showingCode;

    private Date endTime;

    private Short isOverride;

    private Short verifyPeoplesBak;

    private Short isAudit;

    public String getFtfcId() {
        return ftfcId;
    }

    public void setFtfcId(String ftfcId) {
        this.ftfcId = ftfcId == null ? null : ftfcId.trim();
    }

    public String getHallId() {
        return hallId;
    }

    public void setHallId(String hallId) {
        this.hallId = hallId == null ? null : hallId.trim();
    }

    public String getFilmId() {
        return filmId;
    }

    public void setFilmId(String filmId) {
        this.filmId = filmId == null ? null : filmId.trim();
    }

    public Date getPlayTime() {
        return playTime;
    }

    public void setPlayTime(Date playTime) {
        this.playTime = playTime;
    }

   

    public long getReportPeoples() {
		return reportPeoples;
	}

	public void setReportPeoples(long reportPeoples) {
		this.reportPeoples = reportPeoples;
	}

	public long getVerifyPeoples() {
		return verifyPeoples;
	}

	public void setVerifyPeoples(long verifyPeoples) {
		this.verifyPeoples = verifyPeoples;
	}

	public Double getTicketOffice() {
        return ticketOffice;
    }

    public void setTicketOffice(Double ticketOffice) {
        this.ticketOffice = ticketOffice;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

   

    public Integer getIsException() {
		return isException;
	}

	public void setIsException(Integer isException) {
		this.isException = isException;
	}

	public String getShowingCode() {
        return showingCode;
    }

    public void setShowingCode(String showingCode) {
        this.showingCode = showingCode == null ? null : showingCode.trim();
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Short getIsOverride() {
        return isOverride;
    }

    public void setIsOverride(Short isOverride) {
        this.isOverride = isOverride;
    }

    public Short getVerifyPeoplesBak() {
        return verifyPeoplesBak;
    }

    public void setVerifyPeoplesBak(Short verifyPeoplesBak) {
        this.verifyPeoplesBak = verifyPeoplesBak;
    }

    public Short getIsAudit() {
        return isAudit;
    }

    public void setIsAudit(Short isAudit) {
        this.isAudit = isAudit;
    }
}