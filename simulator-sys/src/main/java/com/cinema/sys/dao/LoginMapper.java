package com.cinema.sys.dao;

import java.util.List;
import java.util.Map;

public interface LoginMapper{
	List<String> getLoginAuths(Map<String,Object> paraMap);
}