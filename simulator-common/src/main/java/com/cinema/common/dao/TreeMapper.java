package com.cinema.common.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cinema.sys.model.TreeNode;

public interface TreeMapper  {
	/**模拟器系统树*/
	List<TreeNode> getSimulatorTree(@Param("simulatorId") String simulatorId);
	
	/**产品类别树*/
	List<TreeNode> getTypeTree(@Param("typeId") String typeId);
	
}