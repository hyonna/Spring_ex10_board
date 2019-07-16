package com.iu.s10;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.iu.board.productqna.ProductQnaService;
import com.iu.board.productqna.ProductQnaVO;
import com.iu.util.PageMaker;

//@RestController
@Controller
@RequestMapping("/productQna/")
public class ProductQnaController {
	
	@Inject
	private ProductQnaService productQnaService;
	
	//@RestController 컨트롤러 인데, 모든 메소드에 @Responsbody를 적용해주는 어노테이션
	//단, view 이름을 적어주면 안됨. 딱 결과값만 넘겨주는 어노테이션
	
	
	@RequestMapping(value = "productQnaList", method = RequestMethod.GET)
	@ResponseBody
	public List<ProductQnaVO> getList(PageMaker pageMaker, String pid) throws Exception {
		
		//List<ProductQnaVO> list = productQnaService.getList(pageMaker, pid);
		
		return productQnaService.getList(pageMaker, pid);
	}
	
	
	
	
	@RequestMapping(value = "productQnaWrite", method = RequestMethod.POST)
	@ResponseBody
	public int setWrite(ProductQnaVO productQnaVO) throws Exception {
	
		return productQnaService.setWrite(productQnaVO);
	}

	
	@RequestMapping(value = "productQnaSelect", method = RequestMethod.GET)
	@ResponseBody
	public ProductQnaVO getSelect(int num) throws Exception {
	
		//ProductQnaVO productQnaVO = productQnaService.getSelect(num);
		//productQnaVO.getTitle();
		
		//writer
		//title
		//contents
		//pid
		//{"writer":, "title":}
		
		
		return productQnaService.getSelect(num);
	}
	
	
	

}
