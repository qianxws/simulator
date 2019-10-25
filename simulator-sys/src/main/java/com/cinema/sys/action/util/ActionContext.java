package com.cinema.sys.action.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cinema.sys.model.UserSessionItems;

/**
 * ActionContext cxt
 * 
 * @author userstrator
 */
public class ActionContext {

	private HttpServletRequest httpRequest;
	private HttpServletResponse httpResponse;
	private UserSessionItems userSessionItems;

	private String action;
	private String verb;
	private String userId;
	private String password;
	private String verification_code;
	private int page;
	private int rows;
	private String ajaxParams;
	private String ids;
	private String id;
	private String menuid;
	private String pId;
	private String org;
	private String name;
	private boolean enabled;
	private Integer level;
	private String state;
	private String code;

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	public String getMenuid() {
		return menuid;
	}

	public void setMenuid(String menuid) {
		this.menuid = menuid;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrg() {
		return org;
	}

	public void setOrg(String org) {
		this.org = org;
	}

	public String getPid() {
		return pId;
	}

	public void setPId(String pid) {
		this.pId = pid;
	}

	public void setPid(String pid) {
		this.pId = pid;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pid) {
		this.pId = pid;
	}
	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getVerb() {
		return verb;
	}

	public void setVerb(String verb) {
		this.verb = verb;
	}



	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getVerification_code() {
		return verification_code;
	}

	public void setVerification_code(String verification_code) {
		this.verification_code = verification_code;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String getAjaxParams() {
		return ajaxParams;
	}

	public void setAjaxParams(String ajaxParams) {
		this.ajaxParams = ajaxParams;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public HttpServletRequest getHttpRequest() {
		return httpRequest;
	}

	public void setHttpRequest(HttpServletRequest httpRequest) {
		this.httpRequest = httpRequest;
	}

	public HttpServletResponse getHttpResponse() {
		return httpResponse;
	}

	public void setHttpResponse(HttpServletResponse httpResponse) {
		this.httpResponse = httpResponse;
	}

	public UserSessionItems getUserSessionItems() {
		return userSessionItems;
	}

	public void setUserSessionItems(UserSessionItems userSessionItems) {
		this.userSessionItems = userSessionItems;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}
