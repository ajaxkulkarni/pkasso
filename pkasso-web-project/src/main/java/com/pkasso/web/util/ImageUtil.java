package com.pkasso.web.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.pkasso.web.bo.domain.Project;
import com.pkasso.web.dao.domain.Slide;

public class ImageUtil {
	
	private static final String ROOT_IMAGES_PATH = "/home/itrmitra/Data/Images/";
	//private static final String ROOT_IMAGES_PATH = "F:\\Resoneuronance\\Websites\\PKASSO Website\\Data";
	
	public static void processImages(Project project) throws IOException {

		for (MultipartFile file : project.getFiles()) {
			if (!file.isEmpty()) {
				byte[] bytes = file.getBytes();
				String directory = ROOT_IMAGES_PATH + project.getCategoryName();
				File dir = new File(directory);
				dir.mkdirs();
				String filePath = directory + "/" + file.getOriginalFilename();
				File image = new File(filePath);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(image));
				stream.write(bytes);
				stream.close();
				Slide slide = new Slide();
				slide.setImagePath(filePath);
				project.getSlides().add(slide);
				if(StringUtils.isEmpty(project.getImagePath())) {
					project.setImagePath(filePath);
				}
			}
		}
	}

}
