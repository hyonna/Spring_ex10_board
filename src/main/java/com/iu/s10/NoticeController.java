package com.iu.s10;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.board.BoardDTO;
import com.iu.board.notice.NoticeDTO;
import com.iu.board.notice.NoticeServiceImpl;
import com.iu.util.FileSaver;
import com.iu.util.PageMaker;

@Controller
@RequestMapping("/notice/")
public class NoticeController {
	
	@Inject
	private NoticeServiceImpl noticeService;
	
	//select
	@RequestMapping(value = "noticeSelect", method = RequestMethod.GET)
	public ModelAndView getSelect(int num) throws Exception {
		
		BoardDTO boardDTO = noticeService.getSelect(num);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "notice");
		mv.setViewName("board/boardSelect");
		
		return mv;
	}
	
	
	//List
	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker) throws Exception {
		
		List<BoardDTO> ar = noticeService.getList(pageMaker);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ar);
		mv.addObject("pager", pageMaker);
		mv.addObject("board", "notice");
		mv.setViewName("board/boardList");
		
		return mv;
	}
	
	
	//delete
	@RequestMapping(value = "noticeDelete", method = RequestMethod.GET)
	public String setDelete(int num, HttpSession session) throws Exception {
		
		int result = noticeService.setDelete(num, session);
		
		return "redirect:./noticeList";
	}
	

	//update
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
	public ModelAndView setUpdate(BoardDTO boardDTO, List<MultipartFile> f1, HttpSession session)throws Exception{
		int result = noticeService.setUpdate(boardDTO, f1, session);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:./noticeList");
		
		return mv;
	}
	
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.GET)
	public ModelAndView setUpdate(int num)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		BoardDTO boardDTO = noticeService.getSelect(num);
		
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "notice");
		mv.setViewName("board/boardUpdate");
		
		return mv;
	}
	
	
	//write
	@RequestMapping(value = "noticeWrite", method = RequestMethod.GET)
	public ModelAndView setWrite(ModelAndView mv) throws Exception{
		mv.setViewName("board/boardWrite");
		mv.addObject("board", "notice");
		return mv;
	}
	
	// 파일 보내기
	@RequestMapping(value = "noticeWrite", method = RequestMethod.POST)
	public String setWrite(Model model, BoardDTO boardDTO, List<MultipartFile> f1, HttpSession session) throws Exception {
		
		//매개변수에 BoardDTO를 선언해줌으로써 자동으로 정보가 들어간다.
		int result=noticeService.setWrite(boardDTO, f1, session);
		String view = "common/messageMove";
		
		if(result>0) {
			
			view = "redirect:./noticeList";
		
			
		} else {
			
			model.addAttribute("message", "Write Fail");
			model.addAttribute("path", "./noticeList");
		}
		
		return view;
	}
	
}
