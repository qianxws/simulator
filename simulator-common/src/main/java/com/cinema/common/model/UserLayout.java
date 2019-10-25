package com.cinema.common.model;

/**
 * @Author Simon
 * @Date 2018年8月30日下午3:58:53
 * @Description 页面布局表
 */
public class UserLayout {
    private String layoutId;

    private String userId;

    private String page;

    private String id;

    private String title;

    private String url;

    private String divId;

    private String position;

    private String method;

    private Short show;

    private Short cseq;

    private Short rowNum;

    public String getLayoutId() {
        return layoutId;
    }

    public void setLayoutId(String layoutId) {
        this.layoutId = layoutId == null ? null : layoutId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page == null ? null : page.trim();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getDivId() {
        return divId;
    }

    public void setDivId(String divId) {
        this.divId = divId == null ? null : divId.trim();
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position == null ? null : position.trim();
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method == null ? null : method.trim();
    }

    public Short getShow() {
        return show;
    }

    public void setShow(Short show) {
        this.show = show;
    }

    public Short getCseq() {
        return cseq;
    }

    public void setCseq(Short cseq) {
        this.cseq = cseq;
    }

    public Short getRowNum() {
        return rowNum;
    }

    public void setRowNum(Short rowNum) {
        this.rowNum = rowNum;
    }
}