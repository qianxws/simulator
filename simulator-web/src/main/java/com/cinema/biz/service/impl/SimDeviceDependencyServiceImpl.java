package com.cinema.biz.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import com.cinema.biz.dao.SimSimulatorMapper;
import com.cinema.biz.model.SimSimulator;
import com.cinema.biz.model.base.TSimSimulator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimDeviceDependencyMapper;
import com.cinema.biz.model.SimDeviceDependency;
import com.cinema.biz.model.base.TSimDeviceDependency;
import com.cinema.biz.service.SimDeviceDependencyService;
import tk.mybatis.mapper.entity.Example;

@Service
public class SimDeviceDependencyServiceImpl implements SimDeviceDependencyService {

    @Autowired
    private SimDeviceDependencyMapper simDeviceDependencyDao;

    /**
     * 列表
     */
    @Override
    public List<SimDeviceDependency> getList(Map<String, Object> paraMap) {
        List<SimDeviceDependency> list = simDeviceDependencyDao.getList(paraMap);
        return list;
    }

    /**
     * 详情
     */
    @Override
    public SimDeviceDependency getDetail(Map<String, Object> paraMap) {
        return simDeviceDependencyDao.getDetail(paraMap);
    }

    /**
     * 添加
     */
    @Override
    public int insert(TSimDeviceDependency t) {
        return simDeviceDependencyDao.insertSelective(t);
    }

    /**
     * 更新
     */
    @Override
    public int update(TSimDeviceDependency t) {
        return simDeviceDependencyDao.updateByPrimaryKeySelective(t);
    }

    /**
     * 删除
     */
    @Override
    public int delete(String deviceDependencyId) {
        return simDeviceDependencyDao.deleteByPrimaryKey(deviceDependencyId);
    }
}
