package com.iu.board.notice;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.board.BoardDTO;
import com.iu.board.BoardService;
import com.iu.file.FileDAO;
import com.iu.file.FileDTO;
import com.iu.util.FileSaver;
import com.iu.util.PageMaker;

@Service
public class NoticeServiceImpl implements BoardService {
	
	@Inject
	private NoticeDAOImpl noticeDAO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private FileDAO fileDAO;
	

	@Override
	public int setDelete(int num, HttpSession session) throws Exception {
		
		String realPath = session.getServletContext().getRealPath("/resources/notice");
		List<FileDTO> files = fileDAO.getList(num);
		
		int result = fileDAO.setDeleteAll(num);
		result = noticeDAO.setDelete(num);
		
		for (int i = 0; i < files.size(); i++) {
			fileSaver.deleteFile(realPath, files.get(i).getFname());
		}
		
		return result;
	}

	@Override
	public int setUpdate(BoardDTO boardDTO, List<MultipartFile> f1, HttpSession session) throws Exception {
		
		int result = noticeDAO.setUpdate(boardDTO);
		String realPath = session.getServletContext().getRealPath("/resources/notice");
		
		ArrayList<FileDTO> files = new ArrayList<FileDTO>();
		
		for (MultipartFile multipartFile : f1) {
			if(multipartFile.getOriginalFilename().length()>0) {
				FileDTO fileDTO = new FileDTO();
				fileDTO.setNum(boardDTO.getNum());
				fileDTO.setOname(multipartFile.getOriginalFilename());
				fileDTO.setFname(fileSaver.saveFile3(realPath, multipartFile));
				
				files.add(fileDTO);
			}
		}
		
			//파일 갯수가 0 이상일때만 파일 저장
			if(files.size() > 0) {
				
				result = fileDAO.setWrite(files);
				
			} 
			
		return result;
	}

	@Override
	public int setWrite(BoardDTO boardDTO, List<MultipartFile> multipartFiles, HttpSession session) throws Exception {
		//파일을 하드디스크에 저장
		//notice 테이블에 저장
		//num을 받아와서
		//files 테이블에 저장
		int result = noticeDAO.setWrite(boardDTO);
		
		ArrayList<FileDTO> files = new ArrayList<FileDTO>();
		
		String path = session.getServletContext().getRealPath("/resources/notice");
		System.out.println(path);
		File file = new File(path);
		if(!file.exists()) {
			
			file.mkdirs();
		}
		
		for (MultipartFile multipartFile : multipartFiles) {
			
			if(multipartFile.getOriginalFilename().length()>0) {
				String fname = fileSaver.saveFile3(path, multipartFile);
				FileDTO fileDTO = new FileDTO();
				fileDTO.setNum(boardDTO.getNum());
				fileDTO.setFname(fname);
				fileDTO.setOname(multipartFile.getOriginalFilename());
				//fileDAO.setWrite(fileDTO);
				files.add(fileDTO);
			}
		}
		
		//파일 갯수가 0 이상일때만 파일 저장
		if(files.size() > 0) {
			
			fileDAO.setWrite(files);
		}
		
		return result;
	}

	@Override
	public List<BoardDTO> getList(PageMaker pageMaker) throws Exception {
		
		pageMaker.makeRow();
		int totalCount = noticeDAO.getTotalCount(pageMaker);
		
		//페이징 처리하는 계산
		pageMaker.makePage(totalCount);
		
		return noticeDAO.getList(pageMaker);
	}

	@Override
	public BoardDTO getSelect(int num) throws Exception {
		
		BoardDTO boardDTO = noticeDAO.getSelect(num);
		NoticeDTO noticeDTO = (NoticeDTO) boardDTO;
		
		if(noticeDTO.getFiles().size()==1) {
			if(noticeDTO.getFiles().get(0).getFname()==null) {
				noticeDTO.setFiles(new ArrayList<FileDTO>());
			}
		}
		return boardDTO;
	}

}
