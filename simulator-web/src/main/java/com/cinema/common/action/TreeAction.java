package com.cinema.common.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cinema.biz.dao.SimSimulatorMapper;
import com.cinema.common.service.TreeService;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.model.TreeNode;

import tk.mybatis.mapper.util.StringUtil;

@Component
@Service(name = "treeAction")
public class TreeAction {
	@Autowired
	private TreeService treeService;
	@Autowired
	private SimSimulatorMapper simSimulatorDao;
	
	/**模拟器系统树*/
	public List<TreeNode> getSimulatorTree(ActionContext cxt) {
		String id=cxt.getId();
		id=StringUtil.isEmpty(id)?"0":id;
		List<TreeNode> list=treeService.getSimulatorTree(id);
		for(TreeNode node:list) {
			node.setIsParent(simSimulatorDao.isParent(node.getId()));
		}
		return list;
	}

	/**产品类别树*/
	public List<TreeNode> getTypeTree(ActionContext cxt) {
		String id=cxt.getId();
		id=StringUtil.isEmpty(id)?"0":id;
		List<TreeNode> list=treeService.getTypeTree(id);
		for(TreeNode node:list) {
			node.setIsParent(false);
		}
		return list;
	}
}
