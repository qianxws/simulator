package com.cinema.sys.dao;

import java.util.List;

import com.cinema.sys.model.SysHall;
import com.cinema.sys.model.base.THall;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SysHallMapper    extends Mapper<THall>,MySqlMapper<THall>{
    
    List<SysHall> getListByCinemaId(String cinemaId);
    List<SysHall> getListByCityId(String cityId);
    List<SysHall> getListByProvinceId(String provinceId);
  
}