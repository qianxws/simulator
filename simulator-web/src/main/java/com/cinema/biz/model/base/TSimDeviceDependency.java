package com.cinema.biz.model.base;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sim_device_dependency")
public class TSimDeviceDependency{
	@Id
    private String deviceDependencyId;

    private String dependencyId;

    private String deviceId;

    public String getDeviceDependencyId() {
        return deviceDependencyId;
    }

    public void setDeviceDependencyId(String deviceDependencyId) {
        this.deviceDependencyId = deviceDependencyId == null ? null : deviceDependencyId.trim();
    }

    public String getDependencyId() {
        return dependencyId;
    }

    public void setDependencyId(String dependencyId) {
        this.dependencyId = dependencyId == null ? null : dependencyId.trim();
    }

    public String getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId == null ? null : deviceId.trim();
    }

}