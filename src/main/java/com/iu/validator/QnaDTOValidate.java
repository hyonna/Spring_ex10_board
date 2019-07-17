package com.iu.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.iu.board.BoardDTO;

public class QnaDTOValidate implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		
		//이건 그냥 이렇게 써주면 됨
		return BoardDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		BoardDTO boardDTO = (BoardDTO)target;
		//title 검증
		if(boardDTO.getTitle()==null || boardDTO.getTitle().length()==0) {
			
			errors.rejectValue("title", "title.require");
			//변수명 , properties의 키
			
		}
		
		//writer 검증
		if(boardDTO.getWriter()==null || boardDTO.getWriter().length()==0) {
			
			errors.rejectValue("writer", "require");
			
		}
		
		
		//contents 검증
		if(boardDTO.getContents()==null || boardDTO.getContents().length()==0) {
					
			errors.rejectValue("contents", "require");
					
		}
		
	}
	
	

}
