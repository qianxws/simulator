package com.cinema.common.model.base;

import java.math.BigDecimal;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sys_db_config")
public class TDbConfig {
	
	@Id
    private String dbconfigId;

    private String dataSourceId;

    private String driver;

    private String url;

    private String username;

    private String password;

    private BigDecimal initialsize;

    private BigDecimal maxactive;

    private BigDecimal maxwait;

    public String getDbconfigId() {
        return dbconfigId;
    }

    public void setDbconfigId(String dbconfigId) {
        this.dbconfigId = dbconfigId == null ? null : dbconfigId.trim();
    }

    public String getDataSourceId() {
        return dataSourceId;
    }

    public void setDataSourceId(String dataSourceId) {
        this.dataSourceId = dataSourceId == null ? null : dataSourceId.trim();
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver == null ? null : driver.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public BigDecimal getInitialsize() {
        return initialsize;
    }

    public void setInitialsize(BigDecimal initialsize) {
        this.initialsize = initialsize;
    }

    public BigDecimal getMaxactive() {
        return maxactive;
    }

    public void setMaxactive(BigDecimal maxactive) {
        this.maxactive = maxactive;
    }

    public BigDecimal getMaxwait() {
        return maxwait;
    }

    public void setMaxwait(BigDecimal maxwait) {
        this.maxwait = maxwait;
    }
}