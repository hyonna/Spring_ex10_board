package com.iu.mall.product;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.util.FileSaver;
import com.iu.util.PageMaker;

@Service
public class ProductService{

	@Inject
	private ProductDAO productDAO;
	@Inject
	private OptionsDAO optionsDAO;
	@Inject
	private ThumbnailDAO thumbnailDAO;
	@Inject
	private FileSaver fileSaver;
	
	
	////////////////select
	public ProductVO getSelect(ProductVO productVO) throws Exception {

		return productDAO.getSelect(productVO);
		
	}
	
	//////////////// list
	public List<ProductVO> getList(PageMaker pageMaker) throws Exception {
		
		pageMaker.setPerPage(9);
		
		//startRow
		pageMaker.makeRow();
		List<ProductVO> lists = productDAO.getList(pageMaker);
		
		//lastRow
		int totalCount = productDAO.getTotalCount(pageMaker);
		pageMaker.makePage(totalCount);
		
		
		return lists;
		
	}
	
	//////////////// write
	public int setWrite(ProductVO productVO, List<MultipartFile> f1, HttpSession session) throws Exception {

		//1.Pid 생성
		//현재시간 밀리세컨즈로 변환해서,
		//F+현재시간밀리세컨즈 (사료)
		//T+현재시간밀리세컨즈 (장난감) 등등
		/* System.currentTimeMillis(); */ //시스템의 현재 시간
		Calendar ca = Calendar.getInstance();
		long time = ca.getTimeInMillis();
		String pid = productVO.getCategory()+time;
		
		
		//2.product insert
		productVO.setPid(pid);
		int result = productDAO.setWrite(productVO);
		
		//3.option insert
//		OptionsVO optionsVO = new OptionsVO();
		
		//4.file HDD save insert
		String realPath = session.getServletContext().getRealPath("/resources/product");
		System.out.println(realPath);
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		ArrayList<ThumbnailVO> thumb = new ArrayList<ThumbnailVO>();
		
		for (MultipartFile files : f1) {
			
			if(files.getOriginalFilename().length()>0) {
				
				ThumbnailVO thumbnailVO = new ThumbnailVO();
				thumbnailVO.setPid(pid);
				thumbnailVO.setOname(files.getOriginalFilename());
				thumbnailVO.setFname(fileSaver.saveFile3(realPath, files));
				
				//5.thumbnail insert
				result = thumbnailDAO.setWrite(thumbnailVO);
			}
		}
		
		
		return result;
	}
	
	
}
