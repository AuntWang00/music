package com.music.action;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.music.dao.CustomerDao;
import com.music.model.Music_customer;
import com.music.model.Songs;

import com.mysql.jdbc.PreparedStatement;
import com.opensymphony.xwork2.ActionSupport;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller @Scope("prototype")

public class CustomerAction extends ActionSupport implements SessionAware{
	
@Resource CustomerDao customerDao;
	private static final long serialVersionUID = 1L;
	private String customername;//
    private Music_customer customer;
    private File custPhoto;
	 private String custPhotoFileName;
	 private String custPhotoContentType;
    private Map<String,Object> session;
	private String prePage;
	 private List<Music_customer> customerList;
	 private String keyWords;
private String result;
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
	
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String reg() throws Exception{
		System.out.println("进入reg方法");
		String path = ServletActionContext.getServletContext().getRealPath("/upload"); 
        /*����ͼƬ�ϴ�*/
		
        String CustPhotoFileName = ""; 
   	 	if(custPhoto!= null) {
   	 		InputStream is = new FileInputStream(custPhoto);
   			String fileContentType = this.getCustPhotoContentType();
   			System.out.println("fileContentType:"+fileContentType);
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
   	 	
   	 	System.out.println("custPhoto:"+custPhoto);
        if(custPhoto != null)
        	customer.setFilepath("upload/" + custPhotoFileName);
        else
        	customer.setFilepath("upload/NoImage.jpg");
        
		customerDao.AddCustomer(customer);
		session.put("customer", customer); //Map<String,Object> session;
		System.out.println("reg方法执行完成");
		return "show_view";
	}
	

	public String queryCustomers() throws Exception{
		System.out.println("123");
		customerList = customerDao.QueryCustomerInfo(keyWords);
		System.out.println(keyWords);
		return "show_view1";
	}
	public String showCustomer(){
		customerList = customerDao.QueryAllCustomer();
		return "show_view2";
	}
	
	public String showDetail(){
		customer =customerDao.GetCustomerById(customer.getCustomerid());
		return "show_detail";
	}
	
	public String login() {
		System.out.println("into customerAction.login()");
		System.out.println("customer.getName():"+customer.getName());
		ArrayList<Music_customer> listCustomer = customerDao.QueryCustomerInfo(customer.getName());
		if(listCustomer.size()==0) { 		
			this.errMessage = "用户名不存在";
			System.out.print(this.errMessage);
			return "logininput";
			
		} 
		else{			
		    Music_customer db_customer = listCustomer.get(0);
			if(!db_customer.getPassword().equals(customer.getPassword())) {		
				this.errMessage = " 密码不正确 ";
				System.out.print(this.errMessage);
				return "logininput";
			
		    }else{			
				session.put("customer", db_customer);
				System.out.println("登录验证成功");
				return "success";
		    }
		}
	}

	public String findByName() throws IOException{  
		System.out.println("0");
		ArrayList<Music_customer> listCustomer = customerDao.QueryCustomerInfo(customername);
		System.out.println("1");
	    HttpServletResponse response=  ServletActionContext.getResponse();  
		System.out.println("2");
	    response.setContentType("text/html;charset=UTF-8");  
		System.out.println("3");
	    if(listCustomer.size()!=0) { 
	        //存在 
	    	System.out.println("4");  
	    	 response.getWriter().println("<font color='green'>用户存在，可以登录</font>");  
	    }else{  
	        response.getWriter().println("<font color='red'>用户名不存在，请重新输入</font>");  
	    }  
	    return NONE;  
	}  
	
	public String findByName1() throws IOException{  
		System.out.println("0");
		ArrayList<Music_customer> listCustomer = customerDao.QueryCustomerInfo(customername);
		System.out.println("1");
	    HttpServletResponse response=  ServletActionContext.getResponse();  
		System.out.println("2");
	    response.setContentType("text/html;charset=UTF-8");  
		System.out.println("3");
	    if(listCustomer.size()==0) { 
	        //存在 
	    	System.out.println("4");  
	    	 response.getWriter().println("<font color='green'>用户不存在，可以注册</font>");  
	    }else{  
	        response.getWriter().println("<font color='red'>用户名已存在，请重新输入</font>");  
	    }  
	    return NONE;  
	}  
	
	public String SortCustomerByAll() throws IOException{  
		System.out.println("0");
		ArrayList<Music_customer> listCustomer = customerDao.QueryCustomerInfoByAll(customer.getShouzimu(),customer.getSex(),customer.getCountry());
		System.out.println("1");
	    HttpServletResponse response=  ServletActionContext.getResponse();  
		System.out.println("2");
	    response.setContentType("text/html;charset=UTF-8");  
		System.out.println("3");
	   
	    return "show_view2";  
	}  
	public String SortCustomerBySex() throws IOException{  
		System.out.println("0");
		ArrayList<Music_customer> listCustomer = customerDao.QueryCustomerInfoBySex(customer.getSex());
		System.out.println("1");
	    HttpServletResponse response=  ServletActionContext.getResponse();  
		System.out.println("2");
	    response.setContentType("text/html;charset=UTF-8");  
		System.out.println("3");
	   
	    return "show_view2";  
	}  
	public String SortCustomerByCountry() throws IOException{  
		System.out.println("0");
		ArrayList<Music_customer> listCustomer = customerDao.QueryCustomerInfoBySex(customer.getCountry());
		System.out.println("1");
	    HttpServletResponse response=  ServletActionContext.getResponse();  
		System.out.println("2");
	    response.setContentType("text/html;charset=UTF-8");  
		System.out.println("3");
	   
	    return "show_view2";  
	}  
	public String SortCustomerByShouzimu() throws IOException{  
		System.out.println("0");
		ArrayList<Music_customer> listCustomer = customerDao.QueryCustomerInfoBySex(customer.getShouzimu());
		System.out.println("1");
	    HttpServletResponse response=  ServletActionContext.getResponse();  
		System.out.println("2");
	    response.setContentType("text/html;charset=UTF-8");  
		System.out.println("3");
	   
	    return "show_view2";  
	}  

	public List<Music_customer> getCustomerList() {
		return customerList;
	}

	public void setCustomerList(List<Music_customer> customerList) {
		this.customerList = customerList;
	}

	public String getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

}