package com.iu.board.productqna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.board.BoardDTO;
import com.iu.board.BoardService;
import com.iu.util.PageMaker;

@Service
public class ProductQnaService{
	
	@Inject
	private ProductQnaDAO productQnaDAO;
	

	public int setDelete(int num, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int setUpdate(ProductQnaVO productQnaVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int setWrite(ProductQnaVO productQnaVO) throws Exception {
		return productQnaDAO.setWrite(productQnaVO);
	}

	public List<ProductQnaVO> getList(PageMaker pageMaker, String pid) throws Exception {
		
		pageMaker.makeRow();
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pid", pid);
		map.put("pager", pageMaker);
		return productQnaDAO.getList(map);	
	}

	public ProductQnaVO getSelect(int num) throws Exception {
		return productQnaDAO.getSelect(num);
	}
	
	

}
