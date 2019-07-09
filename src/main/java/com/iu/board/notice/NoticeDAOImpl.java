package com.iu.board.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

import com.iu.board.BoardDAO;
import com.iu.board.BoardDTO;
import com.iu.util.PageMaker;

@Repository
public class NoticeDAOImpl implements BoardDAO {
	
	
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "NoticeMapper.";
	

	@Override
	public int getTotalCount(PageMaker pageMaker) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"totalCount", pageMaker);
	}

	@Override
	public int setDelete(int num) throws Exception {
		int result = sqlSession.delete(NAMESPACE+"noticeDelete", num);
		return result;
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		int result = sqlSession.update(NAMESPACE+"noticeUpdate", boardDTO);
		return result;
	}

	@Override
	public int setWrite(BoardDTO boardDTO) throws Exception {
		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("boardDTO", boardDTO);
//		map.put("pnum", 0);
		
		int result = sqlSession.insert(NAMESPACE+"noticeWrite", boardDTO);
										//mapper + "id" 	//파라미터로 넘길값
		return result;
	}

	@Override
	public List<BoardDTO> getList(PageMaker pageMaker) throws Exception {
		return sqlSession.selectList(NAMESPACE+"noticeList", pageMaker);
	}

	@Override
	public BoardDTO getSelect(int num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"noticeSelect", num);
	}
	
	

}
