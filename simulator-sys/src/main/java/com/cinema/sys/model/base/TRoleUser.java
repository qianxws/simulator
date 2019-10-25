package com.cinema.sys.model.base;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sys_user_role")
public class TRoleUser {
	
	@Id
	@Column(name="user_role_id")
    private String id;

	private String userId;

    private String roleId;

    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }
}