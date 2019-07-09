package com.iu.member;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.board.BoardDTO;
import com.iu.file.MemberFileDAO;
import com.iu.file.MemberFileDTO;
import com.iu.util.FileSaver;
import com.iu.util.PageMaker;

@Service
public class MemberService{
	
	@Inject
	private MemberDAO memberDAO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private MemberFileDAO memberFileDAO;

	public int setDelete(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int setUpdate(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int setWrite(MemberDTO memberDTO, MultipartFile photo, HttpSession session) throws Exception {

		//1.저장 경로
		String path = session.getServletContext().getRealPath("/resources/memberFile");
		System.out.println(path);
		File file = new File(path);
		if(!file.exists()) {
			
			file.mkdirs();
		}
		
		String fname = fileSaver.saveFile3(path, photo);
		MemberFileDTO memberFileDTO = new MemberFileDTO();
		memberFileDTO.setId(memberDTO.getId());
		memberFileDTO.setFname(fname);
		memberFileDTO.setOname(photo.getOriginalFilename());
		
		int result = memberDAO.setWrite(memberDTO);
		result = memberFileDAO.setWrite(memberFileDTO);
		
		return result;
	}

	
	public MemberDTO getSelect(MemberDTO memberDTO) throws Exception {
		
		return memberDAO.getSelect(memberDTO);
		
	}
	
	
	
	public List<BoardDTO> getList(PageMaker pageMaker) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	

}
