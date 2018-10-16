package com.bdi.sp.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect
public class AspectLogger2 {
	private static final Logger logger = LoggerFactory.getLogger(AspectLogger2.class);
	
	@Around("execution(* com.bdi.sp.controller.*.*(..))")
	public Object aroundLog(ProceedingJoinPoint pjp) throws Throwable {
		String sigName = pjp.getSignature().getName();
		String tarName = pjp.getTarget().toString();
		Object []params = pjp.getArgs();
		String str = "";
		for(Object o:params) {
			str += o.toString()+",";
		}
		
		logger.debug("@around Start");
		logger.debug("{}.{}({})", new Object[] {tarName,sigName,str});
		Object obj = null;
		obj = pjp.proceed();
		logger.debug("@around end");
		return obj;
	}
}
