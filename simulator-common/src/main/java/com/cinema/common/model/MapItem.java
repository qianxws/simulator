package com.cinema.common.model;

/**
 * 首页地图对象
 * 
 * @author Simon
 */
public class MapItem {
	
	//地图通用字段－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
	//省Id
	private String provinceId;
	//市Id
	private String cityId;
	//影院Id
	private String cinemaId;
	//省市等级
	private int level;
	//经度纬度数组
	private double[] geoCoord;
    private double longitude;
    private double latitude;
    //颜色值
	private Double value;
	//名称
	private String name;
	//异常数
	private int exceptionCount;
	//是否异常
	private int isException;
	//异常标志
	private String exception;


	//－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
	//上报人数
	private int reportPeoples;
	//票房
	private double ticketOffice;
	//场次
	private int ftfcCount;
	//影院数
	private int cinemaCount;
	//已安装
	private int installedCount;
	//影厅数
	private int halls;
	//座位数
    private int seats;
	
	public String getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public String getCinemaId() {
		return cinemaId;
	}

	public void setCinemaId(String cinemaId) {
		this.cinemaId = cinemaId;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public double[] getGeoCoord() {
		return geoCoord;
	}

	public void setGeoCoord(double[] geoCoord) {
		this.geoCoord = geoCoord;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getExceptionCount() {
		return exceptionCount;
	}

	public void setExceptionCount(int exceptionCount) {
		this.exceptionCount = exceptionCount;
	}

	public int getIsException() {
		return isException;
	}

	public void setIsException(int isException) {
		this.isException = isException;
	}

	public int getReportPeoples() {
		return reportPeoples;
	}

	public void setReportPeoples(int reportPeoples) {
		this.reportPeoples = reportPeoples;
	}

	public double getTicketOffice() {
		return ticketOffice;
	}

	public void setTicketOffice(double ticketOffice) {
		this.ticketOffice = ticketOffice;
	}

	public int getFtfcCount() {
		return ftfcCount;
	}

	public void setFtfcCount(int ftfcCount) {
		this.ftfcCount = ftfcCount;
	}

	public int getCinemaCount() {
		return cinemaCount;
	}

	public void setCinemaCount(int cinemaCount) {
		this.cinemaCount = cinemaCount;
	}

	public int getInstalledCount() {
		return installedCount;
	}

	public void setInstalledCount(int installedCount) {
		this.installedCount = installedCount;
	}

	public int getHalls() {
		return halls;
	}

	public void setHalls(int halls) {
		this.halls = halls;
	}

	public int getSeats() {
		return seats;
	}

	public void setSeats(int seats) {
		this.seats = seats;
	}

	public String getException() {
		return exception;
	}

	public void setException(String exception) {
		this.exception = exception;
	}

}
