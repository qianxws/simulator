package com.cinema.common.model;

import com.cinema.common.model.base.TFtfc;

public class CommonFtfc extends TFtfc {
	
	private Double sum;
	
	private String time;
	
	private String filmName;
	
	private String cinemaId;
	
	private String cinemaName;
	
	private String companyId;
	
	private String companyName;
	
	private String title;//项目，统计表
	
	private int ronda;//场次
	
	private int cinemaSum;//电影院数
	
	private String peopleRatio;
	
	private int exceptionShowings;
	private int totalOffice;
	private int totalPeoples;
	private int totalShowings;
	
	private int totalHall;
	private int totalSeats;
	
	
	
	public int getTotalHall() {
		return totalHall;
	}

	public void setTotalHall(int totalHall) {
		this.totalHall = totalHall;
	}

	public int getTotalSeats() {
		return totalSeats;
	}

	public void setTotalSeats(int totalSeats) {
		this.totalSeats = totalSeats;
	}

	public int getExceptionShowings() {
		return exceptionShowings;
	}

	public void setExceptionShowings(int exceptionShowings) {
		this.exceptionShowings = exceptionShowings;
	}

	public int getTotalOffice() {
		return totalOffice;
	}

	public void setTotalOffice(int totalOffice) {
		this.totalOffice = totalOffice;
	}

	public int getTotalPeoples() {
		return totalPeoples;
	}

	public void setTotalPeoples(int totalPeoples) {
		this.totalPeoples = totalPeoples;
	}

	public int getTotalShowings() {
		return totalShowings;
	}

	public void setTotalShowings(int totalShowings) {
		this.totalShowings = totalShowings;
	}

	public String getPeopleRatio() {
		return peopleRatio;
	}

	public void setPeopleRatio(String peopleRatio) {
		this.peopleRatio = peopleRatio;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getRonda() {
		return ronda;
	}

	public void setRonda(int ronda) {
		this.ronda = ronda;
	}

	public int getCinemaSum() {
		return cinemaSum;
	}

	public void setCinemaSum(int cinemaSum) {
		this.cinemaSum = cinemaSum;
	}

	public String getCinemaId() {
		return cinemaId;
	}

	public void setCinemaId(String cinemaId) {
		this.cinemaId = cinemaId;
	}

	public String getCinemaName() {
		return cinemaName;
	}

	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getFilmName() {
		return filmName;
	}

	public void setFilmName(String filmName) {
		this.filmName = filmName;
	}

	public Double getSum() {
		return sum;
	}

	public void setSum(Double sum) {
		this.sum = sum;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
}