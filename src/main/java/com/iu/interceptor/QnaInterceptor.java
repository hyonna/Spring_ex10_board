package com.iu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class QnaInterceptor extends HandlerInterceptorAdapter{

	//컨트롤러 진입 전에 한번 필터링
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();
		Object obj = session.getAttribute("member");
		boolean result = false;
		
		if(obj != null) {
			
			result = true;
		} else {
			
			response.sendRedirect("../member/memberLogin");
		}
		
		//리턴값이 true면 다음 컨트롤러로 진행
		//리턴값이 false면 다음 컨트롤러 진입 안됨
		return result;
	}

	// 컨트롤러를 진입 후 한번 필터링
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	// jsp를 렌더링 한 후에 필터링(view 직전)
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}
	
	

}
