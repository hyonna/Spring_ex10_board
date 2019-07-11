package com.iu.transfer;

import javax.inject.Inject;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import com.iu.board.BoardDTO;
import com.iu.board.qna.QnaDAO;
import com.iu.board.qna.QnaDTO;

@Component
@Aspect
public class CardCheck {
	
	@Inject
	private QnaDAO qnaDAO;
	
	//@Before("execution(* com.iu.transfer.Bus.*()) || execution(* com.iu.transfer.Subway.subway())")
	public void cardIn(ProceedingJoinPoint joinPoint) {
		
		System.out.println("삑! 학생입니다");
		
	}
	
	//@AfterReturning("execution(* com.iu.transfer.Bus.*())")
	public void cardOut() {
		
		System.out.println("삑! 안녕히 가세요");
	}
	
	//@Around("execution(* com.iu.transfer.Bus.bus2(..))")
	public Object check(ProceedingJoinPoint joinPoint) {
		//ProceedingJoinPoint : pointCut 상속
		//ProceedingJoinPoint는 Around에서만 사용 가능
		
		System.out.println("Card Check In");
		
		Object[] ar = joinPoint.getArgs();
		
		BoardDTO boardDTO = (BoardDTO)ar[0];
		try {
			boardDTO = qnaDAO.getSelect(boardDTO.getNum());
			System.out.println(boardDTO.getWriter());
			System.out.println(boardDTO.getContents());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
//		QnaDTO qnaDTO = (QnaDTO)ar[0];
//		System.out.println(qnaDTO.getNum());
//		System.out.println(qnaDTO.getWriter());
		
		Object obj = null;
		try {
			obj = joinPoint.proceed();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("Card Check Out");
		
		return obj;
	}
	

}
