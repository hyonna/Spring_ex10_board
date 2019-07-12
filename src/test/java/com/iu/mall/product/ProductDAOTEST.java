package com.iu.mall.product;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.iu.s10.AbstractTest;
import com.iu.util.PageMaker;

import oracle.net.aso.p;

public class ProductDAOTEST extends AbstractTest{

	@Inject
	private ProductDAO productDAO;
	
	@Test
	public void test() throws Exception{
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.makeRow();
		pageMaker.makePage(10);
		List<ProductVO> ar = productDAO.getList(pageMaker);

		System.out.println(ar.size());
		System.out.println(ar.get(0).getNailVOs().size());
		
	}

}
