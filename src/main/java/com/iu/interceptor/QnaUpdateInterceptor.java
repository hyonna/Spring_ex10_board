package com.iu.interceptor;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.iu.board.BoardDTO;
import com.iu.member.MemberDTO;

public class QnaUpdateInterceptor extends HandlerInterceptorAdapter{
	
	
	// 컨트롤러를 진입 후 한번 필터링
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		String method = request.getMethod();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		if(method.equals("GET")) {
			
			Map<String, Object> map = modelAndView.getModel();
			if(memberDTO.getId().equals(map.get(0))) {
				
				
			} else {
				
				modelAndView.addObject("message", "Fail");
				modelAndView.addObject("path", "../member/memberLogin");
				modelAndView.setViewName("common/messageMove");
				
			}
			
		}
		
		
		super.postHandle(request, response, handler, modelAndView);
	}
	
	

}
