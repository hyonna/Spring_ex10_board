package com.iu.s10;

import java.sql.SQLException;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionController {
	
	//모든 익셉션 처리를 하는 컨트롤러
	
	
		//@ExceptionHandler(예외발생객체의 클래스명.class)
		//ModelAndView만들어서 보낼 수 있음
		@ExceptionHandler(NumberFormatException.class)
		public void getException() {
			
			
			
		}
		
		@ExceptionHandler(NullPointerException.class)
		public void getNull() {
			
			
		}
		
		
		@ExceptionHandler(SQLException.class)
		public void getSql() {
			
			
			
		}
		
		//모든 익셉션들
		@ExceptionHandler(Exception.class)
		public void getEx() {
			
			
			
		}
		
		
		//익셉션들의 최상위
		@ExceptionHandler(Throwable.class)
		public ModelAndView getAll() {
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("error/error404");
			
			return mv;
			
		}
	
	
}
