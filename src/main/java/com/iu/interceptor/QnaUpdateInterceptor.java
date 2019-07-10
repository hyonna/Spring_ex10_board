package com.iu.interceptor;

import java.util.Iterator;
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
		
		String method = request.getMethod();
		
		if(method.equals("GET")) {
			
			HttpSession session = request.getSession();
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			
			Map<String, Object> map = modelAndView.getModel();
			BoardDTO boardDTO  = (BoardDTO)map.get("dto");
			
			if(!memberDTO.getId().equals(boardDTO.getWriter())) {
				
				modelAndView.addObject("message", "Fail");
				modelAndView.addObject("path", "./"+(String)map.get("board")+"List");
				map.remove("dto");
				modelAndView.setViewName("common/messageMove");
				
			} 
			
		}
		
		// 키를 모를때 꺼내는 방법
//		Iterator<String> it = map.keySet().iterator();
//		while(it.hasNext()) {
//			System.out.println(it.next());
//		}
		
		super.postHandle(request, response, handler, modelAndView);
	}
	
	

}
