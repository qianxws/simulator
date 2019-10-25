package com.cinema.sys.utils;

import java.io.IOException;

import org.apache.ibatis.executor.ErrorContext;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.core.NestedIOException;

public class MySqlSessionFactoryBean extends SqlSessionFactoryBean {
	
	@Override
	public SqlSessionFactory buildSqlSessionFactory() throws IOException {
		try {
			return super.buildSqlSessionFactory();
		}catch(NestedIOException e) {
			System.out.println("mapper.xml配置错误！");
			e.printStackTrace();
			throw new NestedIOException("mapper.xml配置错误！",e);
		}finally {
//			ErrorContext.instance().reset();
		}
	}

}
