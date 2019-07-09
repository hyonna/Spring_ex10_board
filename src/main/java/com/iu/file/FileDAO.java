package com.iu.file;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "FileMapper.";
	
	public List<FileDTO> getList(int num) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"fileList", num);
	}

	public FileDTO getSelect(int fnum) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"fileSelect", fnum);
	}
	
	public int setDelete(int fnum) throws Exception {
		
		int result = sqlSession.delete(NAMESPACE+"fileDelete", fnum);
		
		return result;
	}
	
	public int setDeleteAll(int num) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"fileDeleteAll", num);
	}
	
	public int setUpdate(FileDTO fileDTO) throws Exception {
		
		int result = sqlSession.update(NAMESPACE+"fileUpdate", fileDTO);
		
		return result;
	}
	
	public int setWrite(List<FileDTO> files) throws Exception {
		
		int result = sqlSession.insert(NAMESPACE+"fileWrite", files);
		
		return result;
	}

}
