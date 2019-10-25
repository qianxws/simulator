package com.cinema.sys.service;

import java.util.List;
import java.util.Map;

import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.model.Auth;
import com.cinema.sys.model.TreeNode;
import com.cinema.sys.model.base.TAuth;

public interface AuthService {
public int delete(String authId);

	Auth getDetail(String authId);
	
	/**根据关联条件获取所有权限*/
	List<Auth> getList(Map<String, Object> paraMap);
	
	List<Auth> getList();
	
	List<Auth> getListByParentId(String parentId);
	
	String getAllAuths();
	
	List<TreeNode> getTreeList(Map<String, Object> paraMap);
	
	List<TreeNode> getZtreeWithTree(String parentId);
	

	int insert(TAuth t);
	
	int update(TAuth t) ;
	
//	List<Auth> getTreeList(Map<String, Object> paraMap);
	/**
	 * 获得所有一级节点
	 * @return
	 */
//	public List<Auth> getAllTopList();

	List<TreeNode> getAllAuthTree(String roleId, String id, Integer level) ;
	
	List<TreeNode> getAuthTree(String roleId) ;
	
//	List<Auth> getAllAuth();
	
//	List<Auth> getAuthByPid(String id);
	
	List<Auth> getAllList(String roleId,String id,Integer level);
	
	boolean exist(String authId, String name);

    /**得到下级和下下级id
     * 适用于三级树*/
    List<String> getSubIds(String parentId);

}
