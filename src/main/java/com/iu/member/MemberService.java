package com.iu.member;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	
	
	
	//adminPage에서 삭제할때 메소드
	public int setDelete(String[] id) throws Exception {
		
		//배열을 List로 바꾸는 작업
		List<String> list = Arrays.asList(id);
		
		return memberDAO.setDelete(list);
	}
	
	//회원탈퇴 메소드
	public int setDelete(int num) throws Exception {
		return 0;
	}

	public int setUpdate(MemberDTO memberDTO) throws Exception {
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
	
	
	public List<MemberDTO> getList(PageMaker pageMaker) throws Exception {
		pageMaker.makeRow();
		int totalCount = memberDAO.getTotalCount(pageMaker);
		
		pageMaker.makePage(totalCount);
		
		return memberDAO.getList(pageMaker);
	}
	
	public int getTotalCount(PageMaker pageMaker) throws Exception {
		
		int totalCount = memberDAO.getTotalCount(pageMaker);
		
		return totalCount;
	}

	
	

}
