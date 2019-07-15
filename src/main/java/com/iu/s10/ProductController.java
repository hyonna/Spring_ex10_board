package com.iu.s10;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.mall.product.OptionsVO;
import com.iu.mall.product.ProductService;
import com.iu.mall.product.ProductVO;
import com.iu.util.PageMaker;

@Controller
@RequestMapping("/mall/")
public class ProductController {
	
	@Inject
	private ProductService productService;
	
	//ProductController 내 모든 메소드에 동일하게 model에 담아서 보낼때 공통적으로 -> 모든 메소드에 담아가는
	@ModelAttribute
	public ProductVO getProductVO() throws Exception {
		
		ProductVO productVO = new ProductVO();
		
		return productVO;
		
	}
	
	//("list") = 리턴값의 이름
	@ModelAttribute("list")
	public Map<String, String> getCategory() throws Exception {
		
//		List<String> list = new ArrayList<String>();
//		list.add("사료");
//		list.add("미용");
//		list.add("장난감");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("F", "사료");
		map.put("B", "미용");
		map.put("T", "장난감");
		
		return map;
		
	}
	
	@RequestMapping(value = "productSelect", method = RequestMethod.GET)
	public ModelAndView getSelect(ProductVO productVO) throws Exception {
		
		productVO = productService.getSelect(productVO);
		ModelAndView mv = new ModelAndView();
		
		if(productVO != null) {
			mv.addObject("product", productVO);
			mv.setViewName("mall/productSelect");
		} else {
			
			mv.addObject("message", "No Product");
			mv.addObject("path", "./productList");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "productList", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker) throws Exception {
		
		List<ProductVO> lists = productService.getList(pageMaker);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("productList", lists);
		mv.addObject("pager", pageMaker);
		mv.setViewName("mall/productList");
		
		return mv;
	}
	
	
	//매개변수에 ProductVO productVO 라고 그냥 써도 앞에  @ModelAttribute가 암묵적으로 생성
	@RequestMapping(value = "productWrite", method = RequestMethod.GET)
	public String productWrite() throws Exception {
		
		
		return "mall/productWrite";
	}
	
	
	@RequestMapping(value = "productAdd", method = RequestMethod.POST)
	public ModelAndView productWrite(ProductVO productVO, List<MultipartFile> f1, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		int result = productService.setWrite(productVO, f1, session);
		String message = "Add Fail";
		
		if(result > 0) {
			message = "Add Success";
		} 
			
		mv.addObject("message", message);
		mv.addObject("path", "./productList");
		mv.setViewName("common/messageMove");
		
		
		return mv;
		
	}
	
	

}
