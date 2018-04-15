package com.music.action;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.music.dao.CustomerDao;

import com.music.model.Music_customer;
import com.mysql.jdbc.PreparedStatement;
import com.opensymphony.xwork2.ActionSupport;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


@Controller @Scope("prototype")
//@Results(value = { @Result(name = "fail", value = "/checkPerfail.jsp") })
public class CustomerAction extends ActionSupport implements SessionAware{
	
@Resource CustomerDao customerDao;
    
    private Music_customer customer;
    private File custPhoto;
	 private String custPhotoFileName;
	 private String custPhotoContentType;
    private Map<String,Object> session;
	private String prePage;

	public Music_customer getCustomer() {
		return customer;
	}

	public void setCustomer(Music_customer customer) {
		this.customer = customer;
	}
	
	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	private String errMessage;
	
	public String getErrMessage() {
		return errMessage;
	}

	public void setErrMessage(String errMessage) {
		this.errMessage = errMessage;
	}
	
	
	public String reg() throws Exception{
		String path = ServletActionContext.getServletContext().getRealPath("/upload"); 
        /*处理图片上传*/
        String SongPhotoFileName = ""; 
   	 	if(custPhoto!= null) {
   	 		InputStream is = new FileInputStream(custPhoto);
   			String fileContentType = this.getCustPhotoContentType();
   			System.out.println(fileContentType);
   			if(fileContentType.equals("image/jpeg")  || fileContentType.equals("image/pjpeg"))
   				custPhotoFileName = UUID.randomUUID().toString() +  ".jpg";
   			else if(fileContentType.equals("image/gif"))
   				custPhotoFileName = UUID.randomUUID().toString() +  ".gif";
   			else if(fileContentType.equals("image/png"))
   				custPhotoFileName = UUID.randomUUID().toString() +  ".png";

   			File file = new File(path, custPhotoFileName);
   			OutputStream os = new FileOutputStream(file);
   			byte[] b = new byte[1024];
   			int bs = 0;
   			while ((bs = is.read(b)) > 0) {
   				os.write(b, 0, bs);
   			}
   			is.close();
   			os.close();
   	 	}
        if(custPhoto != null)
        	customer.setFilepath("upload/" + custPhotoFileName);
        else
        	customer.setFilepath("upload/NoImage.jpg");
        
		customerDao.AddCustomer(customer);
		session.put("customer", customer);
		return "show_view";
	}
	
	
	
	public String login() {
		
		ArrayList<Music_customer> listCustomer = customerDao.QueryCustomerInfo(customer.getName());
		if(listCustomer.size()==0) { 
			
			this.errMessage = "账号不存在";
			System.out.print(this.errMessage);
			return "input";
			
		} 
		else{			
			Music_customer db_customer = listCustomer.get(0); //当用户名不允许重名时才这样写
			if(!db_customer.getPassword().equals(customer.getPassword())) {
			
			this.errMessage = " 密码不正确 ";
			System.out.print(this.errMessage);
			return "input";
			
		    }else{
			
			session.put("customer", db_customer); //用户名放到session中
			//跳转前的页面从session中取出来，取出来后将其置空
			prePage = (String) session.get("prePage");
			System.out.println("取出跳转前的页面"+ prePage);
			session.remove("prePage");  
			return "success";
			
		    }
		}
	}

	public String getPrePage() {
		return prePage;
	}

	public void setPrePage(String prePage) {
		this.prePage = prePage;
	}

	public CustomerDao getCustomerDao() {
		return customerDao;
	}

	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	public File getCustPhoto() {
		return custPhoto;
	}

	public void setCustPhoto(File custPhoto) {
		this.custPhoto = custPhoto;
	}

	public String getCustPhotoFileName() {
		return custPhotoFileName;
	}

	public void setCustPhotoFileName(String custPhotoFileName) {
		this.custPhotoFileName = custPhotoFileName;
	}

	public String getCustPhotoContentType() {
		return custPhotoContentType;
	}

	public void setCustPhotoContentType(String custPhotoContentType) {
		this.custPhotoContentType = custPhotoContentType;
	}



}
