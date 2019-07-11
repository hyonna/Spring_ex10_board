package com.iu.board.qna;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.iu.board.BoardDAO;
import com.iu.board.BoardDTO;
import com.iu.util.PageMaker;

public class QnaDAO implements BoardDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="QnaMapper.";
	
	//조회수 증가
	public int setHit(int num) throws Exception {
		
		return sqlSession.update(NAMESPACE+"setHit", num);
	}
	
	//답글 insert
	public int setReply(BoardDTO qnaDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setReply", qnaDTO);
	}
	
	//답글 update(사전작업)
	public int setReplyUpdate(BoardDTO qnaDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"setReplyUpdate", qnaDTO);
	}

	@Override
	public int getTotalCount(PageMaker pageMaker) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getCount", pageMaker);
	}

	@Override
	public int setDelete(int num) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"setDelete", num);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"setUpdate", boardDTO);
	}

	@Override
	public int setWrite(BoardDTO boardDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"setWrite", boardDTO);
	}

	@Override
	public List<BoardDTO> getList(PageMaker pageMaker) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getList", pageMaker);
	}

	@Override
	public BoardDTO getSelect(int num) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getSelect", num);
	}
	
	

}
