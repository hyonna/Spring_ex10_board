package com.iu.qna;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.iu.board.BoardDTO;
import com.iu.board.qna.QnaDAO;
import com.iu.board.qna.QnaService;
import com.iu.s10.AbstractTest;
import com.iu.transfer.Bus;

public class QnaServiceTest extends AbstractTest{
	
	@Inject
	private QnaService qnaService;

	@Test
	public void test() throws Exception{
		
		qnaService.getSelect(210);
		
	}

}
