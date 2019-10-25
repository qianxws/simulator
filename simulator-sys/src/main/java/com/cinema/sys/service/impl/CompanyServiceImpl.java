package com.cinema.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.sys.dao.CompanyMapper;
import com.cinema.sys.model.Company;
import com.cinema.sys.model.User;
import com.cinema.sys.model.base.TCompany;
import com.cinema.sys.service.AreaService;
import com.cinema.sys.service.CompanyService;
import com.cinema.sys.service.UserService;
import com.cinema.sys.utils.MapUtil;

@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired  
    private CompanyMapper companyDao;  
	@Autowired  
    private AreaService areaService; 
	@Autowired  
    private UserService userService; 
	
	/**详情*/
	@Override
	public Company getDetail(Map<String, Object> paraMap) {
		Company m=companyDao.getDetail(paraMap);
		if(m==null)
			return null;
		
		m.setArea(areaService.getDetail(m.getAreaId()));
		User user=userService.getDetail(m.getContact());
		if(user !=null){
			m.setContactName(user.getName());
			m.setTel(user.getTel());
			m.setPhone(user.getPhone());
			m.setQq(user.getQq());
			m.setSex(user.getSex());
			m.setEmail(user.getEmail());
		}
		
		return m;
	}

	@Override
	public Company getDetailById(String id) {
		return this.getDetail(MapUtil.getMap("id",id));
	}
	
	/**列表*/
	@Override
	public List<Company> getList(Map<String, Object> paraMap) {
		List<Company> list=companyDao.getList(paraMap);
		for(Company m:list){
			m.setArea(areaService.getDetail(m.getAreaId()));
			User user=userService.getDetail(m.getContact());
			if(user !=null){
				m.setContactName(user.getName());
				m.setTel(user.getTel());
				m.setPhone(user.getPhone());
				m.setQq(user.getQq());
				m.setSex(user.getSex());
				m.setEmail(user.getEmail());
			}
		}
		return list;
	}

	@Override
	public String getIds(Map<String, Object> paraMap) {
		StringBuilder sb=new StringBuilder();
		List<Company> list=companyDao.getList(paraMap);
		for(Company m:list){
			sb.append(m.getId()+",");
		}
		return sb.toString();
	}

	@Override
	public Integer getMaxNid() {
		Integer maxNid=companyDao.getMaxNid();
		maxNid=maxNid==null?0:maxNid;
		return maxNid+1;
	}
	
	/**添加*/
	@Override
	public int insert(TCompany t) {
		return companyDao.insertSelective(t);
	}
	
	/**更新*/
	@Override
	public int update(TCompany t) {
		return companyDao.updateByPrimaryKeySelective(t);
	}
	
	/**删除*/
	@Override
	public int delete(String id) {
		return companyDao.deleteByPrimaryKey(id);
	}


}
