package com.cinema.sys.model.base;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sys_company")
public class TCompany {
	
	@Id
	@Column(name="company_id")
    private String id;

    private String areaId;

	private Integer nid;

	private String name;
    
    private String domain;

	private String contact;

	private String introduce;

    private String address;
    
    private String mainProducts;

    private String pic;

	private Date createTime;
    
    private String creator;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

    public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public Integer getNid() {
		return nid;
	}

	public void setNid(Integer nid) {
		this.nid = nid;
	}
	
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}
	
    public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getMainProducts() {
		return mainProducts;
	}

	public void setMainProducts(String mainProducts) {
		this.mainProducts = mainProducts;
	}
	
    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
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
		this.creator = creator;
	}
}