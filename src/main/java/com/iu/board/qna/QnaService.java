package com.iu.board.qna;

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


public class QnaService implements BoardService{
	
	@Inject
	private QnaDAO qnaDAO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private FileDAO fileDAO;
	
	//답글
	public int setReply(BoardDTO qnaDTO) throws Exception {
		
		//답글 update
		int result = qnaDAO.setReplyUpdate(qnaDTO);
		//답글 insert
		result = qnaDAO.setReply(qnaDTO);
		
		return result;
	}

	@Override
	public int setDelete(int num, HttpSession session) throws Exception {
		
		String realPath = session.getServletContext().getRealPath("/resources/qna");
		List<FileDTO> files = fileDAO.getList(num);
		
		int result = fileDAO.setDeleteAll(num);
		result = qnaDAO.setDelete(num);
		
		for (int i = 0; i < files.size(); i++) {
			
			fileSaver.deleteFile(realPath, files.get(i).getFname());
		}
		
		return result;
	}

	
	@Override
	public int setUpdate(BoardDTO boardDTO, List<MultipartFile> f1, HttpSession session) throws Exception {
		
		int result = qnaDAO.setUpdate(boardDTO);
		String realPath = session.getServletContext().getRealPath("/resources/qna");
		
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
		
		//qna table insert
		int result = qnaDAO.setWrite(boardDTO);
		String realPath = session.getServletContext().getRealPath("/resources/qna");
		System.out.println(realPath);
		File file2 = new File(realPath);
		if(!file2.exists()) {
			
			file2.mkdirs();
		}
		
		//files table insert
		
		//1.fileDTO의 num => boardDTO.getNum();
		//2.oname => multipartFile.getOriginalName();
		//3.fname => fileSaver.saverFile(path, multipartFile);
		
		ArrayList<FileDTO> files = new ArrayList<FileDTO>();
		
		for (MultipartFile file : multipartFiles) { //for문 돌린만큼 파일 갯수 받기
			
			if(file.getOriginalFilename().length()>0) {
				
				FileDTO fileDTO = new FileDTO();
				
				fileDTO.setNum(boardDTO.getNum());
				fileDTO.setOname(file.getOriginalFilename());
				fileDTO.setFname(fileSaver.saveFile3(realPath, file));
				
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
	public List<BoardDTO> getList(PageMaker pageMaker) throws Exception {

		//1.startRow, lastRow
		pageMaker.makeRow();
		List<BoardDTO> lists = qnaDAO.getList(pageMaker);
		
		//2.paging, totalcount
		int totalCount = qnaDAO.getTotalCount(pageMaker);
		pageMaker.makePage(totalCount);
		
		return lists;
	}

	@Override
	public BoardDTO getSelect(int num) throws Exception {
		
		BoardDTO boardDTO = qnaDAO.getSelect(num);
		QnaDTO qnaDTO = (QnaDTO)boardDTO;
		
		if(qnaDTO.getFiles().size()==1) {
			
			if(qnaDTO.getFiles().get(0).getFname()==null) {
				
				qnaDTO.setFiles(new ArrayList<FileDTO>());
			}
		}
		
		return boardDTO;
	}
	
	

}
