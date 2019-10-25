package com.cinema.sys.model.base;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sys_role_auth")
public class TRoleAuth {
	
	@Id
	@Column(name="role_auth_id")
    private String id;


	private String roleId;

    private String authId;

    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    public String getAuthId() {
        return authId;
    }

    public void setAuthId(String authId) {
        this.authId = authId == null ? null : authId.trim();
    }
}