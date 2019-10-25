package com.cinema.sys.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class SpringBeanUtil implements ApplicationContextAware {
	
    private static ApplicationContext applicationContext = null;

    public static Object getBean(String beanName) {
        return applicationContext.getBean(beanName);
    }

    @Override
    public void setApplicationContext(ApplicationContext content) throws BeansException {
        SpringBeanUtil.applicationContext = content;
    }

    public static <T> T getBean(Class<T> objCla){
    	return applicationContext.getBean(objCla);
    }
}
