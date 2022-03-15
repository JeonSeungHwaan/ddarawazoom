package org.mvc.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import lombok.extern.slf4j.Slf4j;

@Aspect
@Slf4j
@Component
public class SessionCheckAdvice {
	
	@Around("execution(* org.mvc.controller.Coach*.*(..))")
	public Object coachSessionCheck(ProceedingJoinPoint jp)throws Throwable{
		log.info("=====[ AOP - session check ]=====");
		
		// 현재 실행중인 Servlet 설정 정보를 모두 가져옴
		RequestAttributes ra = RequestContextHolder.currentRequestAttributes();
				
		// Servlet 설정 정보에서 Request를 꺼내기 위해 타입 변경
		ServletRequestAttributes sra = (ServletRequestAttributes)ra;
		
		// 타입 변경된 객체에서 Request 객체를 가져옴
		HttpServletRequest request = sra.getRequest();
		
		// Request에서 session 객체를 가져옴
		HttpSession session = request.getSession();
		
		if(session.getAttribute("c_id") == null) {
			return "/main/sessionCheck";
		}
		
		Object obj = jp.proceed();
		return obj;
	}
	
	@Around("execution(* org.mvc.controller.MyRoom*.*(..))")
	public Object userSessionCheck(ProceedingJoinPoint jp)throws Throwable{
		log.info("=====[ AOP - session check ]=====");
		
		// 현재 실행중인 Servlet 설정 정보를 모두 가져옴
		RequestAttributes ra = RequestContextHolder.currentRequestAttributes();
				
		// Servlet 설정 정보에서 Request를 꺼내기 위해 타입 변경
		ServletRequestAttributes sra = (ServletRequestAttributes)ra;
		
		// 타입 변경된 객체에서 Request 객체를 가져옴
		HttpServletRequest request = sra.getRequest();
		
		// Request에서 session 객체를 가져옴
		HttpSession session = request.getSession();
		
		if(session.getAttribute("id") == null) {
			return "/main/sessionCheck";
		}
		
		Object obj = jp.proceed();
		return obj;
	}
	
	@Around("execution(* org.mvc.controller.Manager*.*(..))")
	public Object adminSessionCheck(ProceedingJoinPoint jp)throws Throwable{
		log.info("=====[ AOP - session check ]=====");
		
		// 현재 실행중인 Servlet 설정 정보를 모두 가져옴
		RequestAttributes ra = RequestContextHolder.currentRequestAttributes();
				
		// Servlet 설정 정보에서 Request를 꺼내기 위해 타입 변경
		ServletRequestAttributes sra = (ServletRequestAttributes)ra;
		
		// 타입 변경된 객체에서 Request 객체를 가져옴
		HttpServletRequest request = sra.getRequest();
		
		// Request에서 session 객체를 가져옴
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admin") == null) {
			return "/main/adminSessionCheck";
		}
		
		Object obj = jp.proceed();
		return obj;
	}
}
