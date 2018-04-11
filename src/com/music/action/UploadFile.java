package com.music.action;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UploadFile extends ActionSupport{
	 private static final long serialVersionUID = 1L;  
     
	    private File image; //上传的文件  
	    private String imageFileName; //文件名称  
	    private String imageContentType; //文件类型  
	      
	    public File getImage() {  
	        return image;  
	    }  
	    public void setImage(File image) {  
	        this.image = image;  
	    }  
	    public String getImageFileName() {  
	        return imageFileName;  
	    }  
	    public void setImageFileName(String imageFileName) {  
	        this.imageFileName = imageFileName;  
	    }  
	    public String getImageContentType() {  
	        return imageContentType;  
	    }  
	    public void setImageContentType(String imageContentType) {  
	        this.imageContentType = imageContentType;  
	    }  
	      
	    public String upload(){  
	        String realpath = ServletActionContext.getServletContext().getRealPath("/images");  
	        System.out.println("realpath: "+realpath);  
	        if(image != null){  
	            File savefile = new File(new File(realpath), imageFileName);  
	            System.out.println(savefile);  
	            System.out.println(savefile.getParentFile());  
	            if(savefile.getParentFile().exists()){  
	                try {  
	                    savefile.getParentFile().mkdirs();  
	                    FileUtils.copyFile(image, savefile);  
	                } catch (IOException e) {  
	                    e.printStackTrace();  
	                }  
	                ActionContext.getContext().put("message", "文件上传成功");  
	            }  
	        }  
	        /** 
	         * 若要存入数据库 
	         * fileName是在entity实体类中声明存放文件名称的变量 
	         * yu.setFileName(imageFileName) 这样将文件名称存入数据库 
	         * 文件路径为：savefile 
	         */  
	        return "success";  
	    }  
}
