package com.cinema.sys.model.base;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sys_site")
public class TSite {
	
	@Id
	@Column(name="site_id")
    private String id;

	private String name;

    private String title;

    private String keywords;

    private String description;

    private String record;

    private String copyright;

    private String company;
    
    private Integer defaultAreaNid;

	private Boolean isToken;

	private String uploadPath;
	

    private Boolean ftpEnabled;
	private String ftpHost;
	private String ftpUser;
	private String ftpPassword;
	private int ftpPort;
	private String ftpPath;

    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords == null ? null : keywords.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record == null ? null : record.trim();
    }

    public String getCopyright() {
        return copyright;
    }

    public void setCopyright(String copyright) {
        this.copyright = copyright == null ? null : copyright.trim();
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company == null ? null : company.trim();
    }
    
    public Integer getDefaultAreaNid() {
		return defaultAreaNid;
	}

	public void setDefaultAreaNid(Integer defaultAreaNid) {
		this.defaultAreaNid = defaultAreaNid;
	}
    
    public Boolean getIsToken() {
        return isToken;
    }

    public void setIsToken(Boolean isToken) {
        this.isToken = isToken;
    }
    
	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

    public Boolean getFtpEnabled() {
        return ftpEnabled;
    }

    public void setFtpEnabled(Boolean ftpEnabled) {
        this.ftpEnabled = ftpEnabled;
    }
    
	public String getFtpHost() {
		return ftpHost;
	}

	public void setFtpHost(String ftpHost) {
		this.ftpHost = ftpHost;
	}

	public String getFtpUser() {
		return ftpUser;
	}

	public void setFtpUser(String ftpUser) {
		this.ftpUser = ftpUser;
	}

	public String getFtpPassword() {
		return ftpPassword;
	}

	public void setFtpPassword(String ftpPassword) {
		this.ftpPassword = ftpPassword;
	}

	public int getFtpPort() {
		return ftpPort;
	}

	public void setFtpPort(int ftpPort) {
		this.ftpPort = ftpPort;
	}

	public String getFtpPath() {
		return ftpPath;
	}

	public void setFtpPath(String ftpPath) {
		this.ftpPath = ftpPath;
	}

}