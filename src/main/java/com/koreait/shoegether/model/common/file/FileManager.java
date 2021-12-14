package com.koreait.shoegether.model.common.file;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.koreait.shoegether.exception.FileDeleteException;
import com.koreait.shoegether.exception.UploadException;

@Component
public class FileManager {
	String savePath = "/resources/data/";
	
	public String getExt(String path) {
		return path.substring(path.lastIndexOf(".")+1, path.length());
	}
	
	public void deleteFile(ServletContext context, String filename) throws FileDeleteException{
		File file = new File(context.getRealPath(savePath+filename));
		System.out.println("경로 : "+context.getRealPath(savePath+filename));
		boolean result = file.delete();
		if(!result) {
			throw new FileDeleteException(filename+"파일 삭제 실패");
		}
	}
	
	public void saveFile(ServletContext context, String filename, MultipartFile multi) throws UploadException{
		try {
			multi.transferTo(new File(context.getRealPath(savePath+filename)));
		} catch (IllegalStateException e) {
			e.printStackTrace();
			throw new UploadException("파일 업로드 실패");
		} catch (IOException e) {
			e.printStackTrace();
			throw new UploadException("파일 업로드 실패");
		}
	}
}
