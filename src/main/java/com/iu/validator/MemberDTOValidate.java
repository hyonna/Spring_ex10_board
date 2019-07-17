package com.iu.validator;

import java.util.regex.Pattern;

import javax.inject.Inject;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.iu.member.MemberDAO;
import com.iu.member.MemberDTO;

public class MemberDTOValidate implements Validator{
	
	@Inject
	private MemberDAO memberDAO;

	@Override
	public boolean supports(Class<?> clazz) {
		
		return MemberDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		MemberDTO memberDTO = (MemberDTO)target;
		
		String ex1 = "\\w{6,12}";
		String ex2 = "[a-z]+";

		boolean check = Pattern.matches(ex2, memberDTO.getId());
		System.out.println(check);
		
		//id검증
		if(memberDTO.getId()==null || memberDTO.getId().length()==0) {
			
			errors.rejectValue("id", "member.id");
			
		} else {
			
			try {
				
				MemberDTO checkId = memberDAO.getId(memberDTO);
				if(checkId != null) {
					errors.rejectValue("id", "member.id.duplicate");
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			};
		}
		
		//pw검증
		if(memberDTO.getPw()==null || memberDTO.getPw().length()==0) {
			
			errors.rejectValue("pw2", "member.pw");
		} else {
			
			if(!memberDTO.getPw().equals(memberDTO.getPw2())) {
				
				errors.rejectValue("pw2", "member.pw.equal");
			}
		}
		
		if(memberDTO.getName()==null || memberDTO.getName().length()==0) {
					
			errors.rejectValue("name", "member.name");
		}
		
		if(memberDTO.getEmail()==null || memberDTO.getEmail().length()==0) {
			
			errors.rejectValue("email", "member.email");
		}
		
		
		
		
	}
	
	

}
