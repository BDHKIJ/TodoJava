package org.todo.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.todo.domain.ImageDTO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/image/*")
public class UploadController {
	//폴더 생성을 위한 문자열
	private String createFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", "/");
	}
	//확장자 체크
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	@PostMapping("/uploadimage")
	public ResponseEntity<ImageDTO> uploadimage(MultipartFile[] uploadFile) {
		ImageDTO dto = new ImageDTO();
		String uploadFolder = "C:\\images";
		String uploadFolderPath = createFolder();
		//폴더 생성
		File uploadPath = new File(uploadFolder,uploadFolderPath);
		log.info("경로 : "+uploadFolderPath);
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		log.info(uploadFile.toString());
		for(MultipartFile multipartfile : uploadFile) {
			log.info(multipartfile.getOriginalFilename());
			String uploadFileName = multipartfile.getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString()+"_"+uploadFileName;
			File saveFile = new File(uploadPath,uploadFileName);
			try {
				if(!checkImageType(saveFile)) {
					dto.setCheck(false);
				}
				else {
					multipartfile.transferTo(saveFile);
					dto.setCheck(true);
					dto.setFilename(uploadFileName);
					dto.setUploadpath(uploadFolderPath);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			log.info("체크 : "+dto.isCheck());
			log.info("파일이름 : "+dto.getFilename());
			log.info("경로 : "+dto.getUploadpath());
		}
		return new ResponseEntity<ImageDTO>(dto,HttpStatus.OK);
	}
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String filename){
		log.info("filename : "+ filename);
		File file = new File("C:\\images\\"+filename);
		ResponseEntity<byte[]> result = null;
		HttpHeaders header = new HttpHeaders();
		try {
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	//업로드 이미지 삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName,String type){
		log.info("deleteFile : "+fileName);
		File file;
		try {
			file = new File("C:\\images\\"+URLDecoder.decode(fileName,"UTF-8"));
			file.delete();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
}
