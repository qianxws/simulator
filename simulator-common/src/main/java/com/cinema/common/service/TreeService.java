package com.cinema.common.service;

import java.util.List;

import com.cinema.sys.model.TreeNode;

public interface TreeService {
	
	/**模拟器系统树*/
	List<TreeNode> getSimulatorTree(String simulatorId);
	
	/**产品类别树*/
	List<TreeNode> getTypeTree(String typeId);
	
}
