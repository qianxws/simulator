package com.cinema.common.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.common.dao.TreeMapper;
import com.cinema.common.service.TreeService;
import com.cinema.sys.model.TreeNode;

@Service
public class TreeServiceImpl implements TreeService {
	
	@Autowired  
    private TreeMapper treeDao;


	@Override
	public List<TreeNode> getSimulatorTree(String simulatorId) {
		return treeDao.getSimulatorTree(simulatorId);
	}


	@Override
	public List<TreeNode> getTypeTree(String typeId) {
		return treeDao.getTypeTree(typeId);
	}
}
