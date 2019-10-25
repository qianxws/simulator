package com.cinema.sys.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.sys.dao.AuthMapper;
import com.cinema.sys.dao.UserMapper;
import com.cinema.sys.model.Auth;
import com.cinema.sys.model.TreeNode;
import com.cinema.sys.model.base.TAuth;
import com.cinema.sys.service.AuthService;
import com.cinema.sys.utils.MapUtil;

@Service
public class AuthServiceImpl implements AuthService {

	@Autowired  
    private AuthMapper authDao;
	@Autowired  
    private UserMapper userDao;
	
	@Override
    public Auth getDetail(String authId) {  
        return authDao.getDetail(authId);
    }

	@Override
	public List<Auth> getList(Map<String, Object> paraMap){
		return authDao.getList(paraMap);
	}

	@Override
	public List<Auth> getList(){
		return authDao.getList(new HashMap<String,Object>(){{}});
	}
	
	@Override
    public List<Auth> getListByParentId(String parentId) { 
		String pid=parentId==null || parentId.equals("")?"0":parentId;
        return authDao.getList(MapUtil.getMap("parentId",pid));
    }

	@Override
	public String getAllAuths(){
		StringBuilder auths=new StringBuilder();
		List<Auth> list=this.getList();
		for(Auth auth:list)
			auths.append(auth.getCode()+",");
		return auths.toString();
	}
	
	/**获取菜单数据，填充treetable*/
	@Override
	public List<TreeNode> getTreeList(Map<String, Object> paraMap) {
		List<TreeNode> l = new ArrayList<TreeNode>();

		List<Auth> allAuth = authDao.getList(paraMap);
		if (allAuth != null && allAuth.size() > 0) {
			for (Auth auth : allAuth) {
				TreeNode node = new TreeNode();
				String name = auth.getName();
				node.setChecked(false);
				// 判断是否有下一级
				// 调用getIsParent方法
				if (getIsParent(auth.getAuthId())) {
					node.setIsParent(true);
					// 默认设置打开节点数量，待后期根据数据量进行设置
					node.setOpen(true);
				} else {
					node.setIsParent(false);
					node.setOpen(false);
				}
				node.setId(auth.getAuthId());
				node.setName(name);
//				if (isTreeTable) {
					Map<String, Object> attributes = new HashMap<String, Object>();
					attributes.put("code", auth.getCode());
					attributes.put("description", auth.getDescription());
					attributes.put("state", auth.getState());
					attributes.put("createTime", auth.getCreateTime());
					attributes.put("creator", auth.getCreator());
					attributes.put("isDefault", auth.getIsDefault()==null ||auth.getIsDefault()==false?false:true);
					if(StringUtils.isNotBlank(auth.getCreator())) {
						attributes.put("creatorName",userDao.selectByPrimaryKey(auth.getCreator()).getName());
					}
					attributes.put("pname",
							auth.getParentId().equals("0") ? "根节点" : authDao.getNameById(auth.getParentId()));
					node.setAttributes(attributes);
//				}
				node.setParentId(auth.getParentId());
				l.add(node);
			}
		}
		return l;
	}
	
	/**获取下拉树数据，进行填充tree 支持模糊搜索*/
	@Override
	public List<TreeNode> getZtreeWithTree(String parentId) {
		List<Auth> auths = this.getListByParentId(parentId);
		List<TreeNode> l = new ArrayList<TreeNode>();
		if (StringUtils.isBlank(parentId)) {// 加入根节点
			l.add(this.getTreeNode());
		}
		if (auths != null && auths.size() > 0) {
			for (TAuth t : auths) {
				TreeNode node = new TreeNode();
				String name = t.getName();
				node.setChecked(false);
				// 判断是否有下一级
				if (getIsParent(t.getAuthId())) {
					node.setIsParent(true);
					//默认设置打开节点数量，待后期根据数据量进行设置
					node.setOpen(true);
				} else {
					node.setIsParent(false);
					node.setOpen(false);
				}
				node.setId(t.getAuthId());
				node.setName(name);
				node.setParentId(t.getParentId());
				l.add(node);
			}
		}
		return l;
	}

	@Override
	public int delete(String authId) {
		return authDao.deleteByPrimaryKey(authId);
	}
	
	@Override
	public int insert(TAuth t) {
		return authDao.insertSelective(t);
	}

	@Override
	public int update(TAuth t) {
		return authDao.updateByPrimaryKeySelective(t);
	}

	/**
	 * 查询是否有子权限
	 * @param id
	 * @return
	 */
	private Boolean hasChildAuth(String id) {
		return authDao.hasChildAuth(id)>0?true:false;
	}
	
	/**
	 * 获得所有权限的树型列表
	 * 
	 * @return
	 */
	@Override
	public List<TreeNode> getAllAuthTree(String roleId, String id, Integer level) {
		List<TreeNode> treeList = new ArrayList<>();
		roleId=roleId == null ? " " : roleId;
		List<Auth> authList = authDao.getAllList(roleId,id,level);
		for (Auth item : authList) {
			TreeNode node = new TreeNode();
			node.setId(item.getAuthId());
			node.setName(item.getName());
			node.setParentId(id);
			
			if (item.getRoleId() != null) {
				node.setChecked(true);
			}
			
			// 判断是否有子节点
			if(hasChildAuth(node.getId())) {
				node.setIsParent(true);
			}else {
				node.setIsParent(false);
			}
			
			treeList.add(node);
		}
		
		return treeList;
	}
	
	/**
	 * 获得所有权限的树型列表
	 * 
	 * @return
	 */
	@Override
	public List<TreeNode> getAuthTree(String roleId) {
		List<TreeNode> treeList = new ArrayList<>();
		roleId=roleId == null ? " " : roleId;
		List<Auth> authList = authDao.getAuthTree(roleId);
		for (Auth item : authList) {
			TreeNode node = new TreeNode();
			node.setId(item.getAuthId());
			node.setName(item.getName());
			node.setParentId(item.getParentId());
			
			if (item.getRoleId() != null) {
				node.setChecked(true);
			}
			
			// 判断是否有子节点
			if(hasChildAuth(node.getId())) {
				node.setIsParent(true);
			}else {
				node.setIsParent(false);
			}
			
			treeList.add(node);
		}
		
		return treeList;
	}
	
	@Override
	public List<Auth> getAllList(String roleId,String id,Integer level) {
		List<Auth> list = authDao.getAllList(roleId,id,level);
		return list;
	}
	
	@Override
	public boolean exist(String authId, String name) {
		return authDao.exist(authId, name);
	}

	public TreeNode getTreeNode() {
		TreeNode node = new TreeNode();
		node.setChecked(true);
		node.setIsParent(true);
		node.setOpen(false);
		node.setId("-1");
		node.setName("根节点");
		node.setParentId("0");
		return node;
	}
	
	/**
	 * 根据权限id 判断是否是父节点
	 * 
	 * @param authid
	 *            权限id
	 * @return
	 */
	private boolean getIsParent(String authId) {
		List<Auth> authById = this.getListByParentId(authId);
		return authById != null && authById.size() > 0 ? true : false;
	}

	@Override
	public List<String> getSubIds(String parentId) {
		return authDao.getSubIds(parentId);
	}
	

}
