package com.cinema.sys.action.util;

import java.lang.annotation.Target;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.ElementType;

/**
 * 用以修饰类
 * 
 * 描述Web模块对应的WebService。例如：<br>@Service(name="用户管理")
 * @param name 为模块名称
 *
 */
@Retention(RetentionPolicy.RUNTIME) 
@Target(ElementType.TYPE) 
public @interface Service {
	String name() default "";
	boolean login() default true; 
}
