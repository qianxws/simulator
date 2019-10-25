package com.cinema.biz.model.base;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sim_device")
public class TSimDevice {
	@Id
    private String deviceId;

    private String simulatorId;

    private String typeId;

    private String name;

    private String code;

    private Date enablingTime;

    private String location;

    private String pc;

    private String ip;

    private String mac;

    private Date delayStartTime;

    private Long operateTimes;

    private Long faultTimes;

    private Long repairTimes;

    private Long maintenanceTimes;

    private Long duration;

    private String operate;

    private Date operateTime;

    private Boolean isStart;

    private BigDecimal cpuRate;

    private BigDecimal ramRate;

    private Date startTime;

    private Date endTime;

    private Date softStartTime;

    private BigDecimal discRate;

    private BigDecimal temp;

    private String extendAttr;

    private Date createTime;

    private String creator;

    private Date updateTime;

    private String updator;

    public String getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId == null ? null : deviceId.trim();
    }

    public String getSimulatorId() {
        return simulatorId;
    }

    public void setSimulatorId(String simulatorId) {
        this.simulatorId = simulatorId == null ? null : simulatorId.trim();
    }

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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public Date getEnablingTime() {
        return enablingTime;
    }

    public void setEnablingTime(Date enablingTime) {
        this.enablingTime = enablingTime;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location == null ? null : location.trim();
    }

    public String getPc() {
        return pc;
    }

    public void setPc(String pc) {
        this.pc = pc == null ? null : pc.trim();
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public String getMac() {
        return mac;
    }

    public void setMac(String mac) {
        this.mac = mac == null ? null : mac.trim();
    }

    public Date getDelayStartTime() {
        return delayStartTime;
    }

    public void setDelayStartTime(Date delayStartTime) {
        this.delayStartTime = delayStartTime;
    }

    public Long getOperateTimes() {
        return operateTimes;
    }

    public void setOperateTimes(Long operateTimes) {
        this.operateTimes = operateTimes;
    }

    public Long getFaultTimes() {
        return faultTimes;
    }

    public void setFaultTimes(Long faultTimes) {
        this.faultTimes = faultTimes;
    }

    public Long getRepairTimes() {
        return repairTimes;
    }

    public void setRepairTimes(Long repairTimes) {
        this.repairTimes = repairTimes;
    }

    public Long getMaintenanceTimes() {
        return maintenanceTimes;
    }

    public void setMaintenanceTimes(Long maintenanceTimes) {
        this.maintenanceTimes = maintenanceTimes;
    }

    public Long getDuration() {
        return duration;
    }

    public void setDuration(Long duration) {
        this.duration = duration;
    }

    public String getOperate() {
        return operate;
    }

    public void setOperate(String operate) {
        this.operate = operate == null ? null : operate.trim();
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

    public Boolean getIsStart() {
        return isStart;
    }

    public void setIsStart(Boolean isStart) {
        this.isStart = isStart;
    }

    public BigDecimal getCpuRate() {
        return cpuRate;
    }

    public void setCpuRate(BigDecimal cpuRate) {
        this.cpuRate = cpuRate;
    }

    public BigDecimal getRamRate() {
        return ramRate;
    }

    public void setRamRate(BigDecimal ramRate) {
        this.ramRate = ramRate;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getSoftStartTime() {
        return softStartTime;
    }

    public void setSoftStartTime(Date softStartTime) {
        this.softStartTime = softStartTime;
    }

    public BigDecimal getDiscRate() {
        return discRate;
    }

    public void setDiscRate(BigDecimal discRate) {
        this.discRate = discRate;
    }

    public BigDecimal getTemp() {
        return temp;
    }

    public void setTemp(BigDecimal temp) {
        this.temp = temp;
    }

    public String getExtendAttr() {
        return extendAttr;
    }

    public void setExtendAttr(String extendAttr) {
        this.extendAttr = extendAttr == null ? null : extendAttr.trim();
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