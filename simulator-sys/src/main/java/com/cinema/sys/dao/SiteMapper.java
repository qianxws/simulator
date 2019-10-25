package com.cinema.sys.dao;

import java.util.List;

import com.cinema.sys.model.Site;
import com.cinema.sys.model.base.TSite;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SiteMapper  extends Mapper<TSite>,MySqlMapper<TSite> {
    /**列表*/
    List<Site> getList();
}