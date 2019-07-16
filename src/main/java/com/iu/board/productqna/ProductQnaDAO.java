package com.iu.board.productqna;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.iu.board.BoardDAO;
import com.iu.board.BoardDTO;
import com.iu.util.PageMaker;

@Repository
public class ProductQnaDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="ProductQnaMapper.";
	
	//조회수 증가
	public int setHit() throws Exception {
			
		return 0;
	}
		
		//답글 insert
	public int setReply() throws Exception {
		return 0;
	}
		
	//답글 update(사전작업)
	public int setReplyUpdate() throws Exception {
		
		return 0;
	}

	public int getTotalCount(PageMaker pageMaker) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int setDelete(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int setWrite(ProductQnaVO productqnaVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setWrite", productqnaVO);
	}

	public List<ProductQnaVO> getList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", map);
	}

	public ProductQnaVO getSelect(int num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getSelect", num);
	}
	
	
	

}
