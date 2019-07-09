package com.iu.s10;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.file.MemberFileDTO;
import com.iu.member.MemberDTO;
import com.iu.member.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "memberPage", method = RequestMethod.GET)
	public ModelAndView myPage(ModelAndView mv, HttpSession session) throws Exception {
		
		session.getAttribute("member");
		
		mv.addObject(session);
		mv.setViewName("member/memberPage");
		
		return mv;
		
	}
	
	@RequestMapping(value = "memberLogout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		
		session.invalidate();
		
		return "redirect:../";
		
	}
	
	@RequestMapping(value = "memberLogin", method = RequestMethod.GET)
	public void getSelect() throws Exception {}
	
	@RequestMapping(value = "memberLogin", method = RequestMethod.POST)
	public ModelAndView getSelect(MemberDTO memberDTO, MemberFileDTO memberFileDTO, HttpSession session) throws Exception {
		
		memberDTO = memberService.getSelect(memberDTO);
		String message = "Login Fail";
		
		if(memberDTO != null) {
			
			session.setAttribute("member", memberDTO);
			message = "Login Success";
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/messageMove");
		mv.addObject("message", message);
		mv.addObject("path", "../");
		
		return mv;
		
	}
	
	@RequestMapping(value = "memberJoin", method = RequestMethod.GET)
	public void setWrite() throws Exception {}
	
	
	
	@RequestMapping(value = "memberJoin", method = RequestMethod.POST)
	public ModelAndView setWrite(MemberDTO memberDTO, MultipartFile photo, HttpSession session) throws Exception {
		
		int result = memberService.setWrite(memberDTO, photo, session);
		String message = "Join Fail";
		
		if(result > 0) {
			
			message = "Join Success";
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/messageMove");
		mv.addObject("message", message);
		mv.addObject("path", "../");
		
		return mv;
	}

}
