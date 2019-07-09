package com.iu.util;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileSaver {
	
	//1. Spring에서 제공하는 메서드 FileCopyUtils클래스의 copy 메서드 사용
	//저장경로, MultipartFile
	public String saveFile(String realPath, MultipartFile multipartFile) throws Exception {
		
		File file = new File(realPath);
		if(!file.exists()) {
			
			file.mkdirs();
		}
		
		//a. 저장할 파일명을 생성
		//	 UUID(유니버셜 유니크 아이디) 클래스를 사용
		String fileSystemName = UUID.randomUUID().toString();
		
		//확장자 가져오기
		String originalName = multipartFile.getOriginalFilename();
		originalName = originalName.substring(originalName.lastIndexOf("."));
		
		fileSystemName = fileSystemName + originalName;
		
		//저장
		file = new File(realPath, fileSystemName);
		FileCopyUtils.copy(multipartFile.getBytes(), file);
		
		return fileSystemName;
	}

	
	//2. OutPutStream 연결
	public String saveFile2(String realPath, MultipartFile multipartFile) throws Exception {
		
		File file = new File(realPath);
		if(!file.exists()) {
			
			file.mkdirs();
		}
		
		//a. 저장할 파일명을 생성
		//	 UUID(유니버셜 유니크 아이디) 클래스를 사용
		String fileSystemName = UUID.randomUUID().toString();
		
		//확장자 가져오기
		String originalName = multipartFile.getOriginalFilename();
		originalName = originalName.substring(originalName.lastIndexOf("."));
		
		fileSystemName = fileSystemName + originalName;
		
		
		//저장
		file = new File(realPath, fileSystemName);
		FileOutputStream fs = new FileOutputStream(file);
		fs.write(multipartFile.getBytes());
		
		
		return fileSystemName;
	}
	
	
	//3. MultipartFile Class의 transferTo 메서드 사용
	public String saveFile3(String realPath, MultipartFile multipartFile) throws Exception {
		
		File file = new File(realPath);
		if(!file.exists()) {
			
			file.mkdirs();
		}
		
		//a. 저장할 파일명을 생성
		//	 UUID(유니버셜 유니크 아이디) 클래스를 사용
		String fileSystemName = UUID.randomUUID().toString();
		
		//확장자 가져오기
		String originalName = multipartFile.getOriginalFilename();
		originalName = originalName.substring(originalName.lastIndexOf("."));
		
		fileSystemName = fileSystemName + originalName;
		
		
		//저장
		file = new File(realPath, fileSystemName);
		multipartFile.transferTo(file);
		
	
		return fileSystemName;
		
	}
	
	//파일 삭제 메소드
	public int deleteFile(String realPath, String fname) throws Exception {
		
		File file = new File(realPath, fname);
		boolean result = false;
		int check = 0;
		
		if(file.exists()) {
			result = file.delete();
		}
		if(result) {
			check = 1;
		}
		
		return check;
	}
	
	
	
}
