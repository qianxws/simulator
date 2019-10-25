package com.cinema.biz.model;

import com.cinema.biz.model.base.TSimDeviceDependency;

public class SimDeviceDependency extends TSimDeviceDependency {
	private String simulatorId;
	private String code;
	private String dependencyName;
	private String deviceId; // 设备id
	private String sysName; // 系统名称
	private String subSysName; // 分系统名称
	private String productName; // 产品名称
	public String getSimulatorId() {
		return simulatorId;
	}
	public void setSimulatorId(String simulatorId) {
		this.simulatorId = simulatorId;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDependencyName() {
		return dependencyName;
	}
	public void setDependencyName(String dependencyName) {
		this.dependencyName = dependencyName;
	}

	@Override
	public String getDeviceId() {
		return deviceId;
	}

	@Override
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}

	public String getSysName() {
		return sysName;
	}

	public void setSysName(String sysName) {
		this.sysName = sysName;
	}

	public String getSubSysName() {
		return subSysName;
	}

	public void setSubSysName(String subSysName) {
		this.subSysName = subSysName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
}