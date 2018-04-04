package com.music.action;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.music.dao.CustomerDao;
import com.music.model.Customer;
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
public class CustomerAction extends ActionSupport implements SessionAware{
	
@Resource CustomerDao customerDao;
    
    private Customer customer;
    
    private Map<String,Object> session;
	private String prePage;
	private File customerPhoto;
	private String customerPhotoFileName;
	private String customerPhotoContentType;

	public CustomerDao getCustomerDao() {
		return customerDao;
	}

	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	public File getCustomerPhoto() {
		return customerPhoto;
	}

	public void setCustomerPhoto(File customerPhoto) {
		this.customerPhoto = customerPhoto;
	}

	public String getCustomerPhotoFileName() {
		return customerPhotoFileName;
	}

	public void setCustomerPhotoFileName(String customerPhotoFileName) {
		this.customerPhotoFileName = customerPhotoFileName;
	}

	public String getCustomerPhotoContentType() {
		return customerPhotoContentType;
	}

	public void setCustomerPhotoContentType(String customerPhotoContentType) {
		this.customerPhotoContentType = customerPhotoContentType;
	}
	
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
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
		
		String path = ServletActionContext.getServletContext().getRealPath("/upload");//图片放在哪儿 放在了tomcat底下upload文件里
		String customerPhotoFileName = "";
		if(customerPhoto!=null){
			InputStream is = new FileInputStream(customerPhoto);
			OutputStream os = new FileOutputStream(customerPhoto);
			String fileContentType = this.getCustomerPhotoContentType();
			System.out.println(fileContentType);
			if(fileContentType.equals("image/jpeg")||fileContentType.equals("image/pjpeg"))
				customerPhotoFileName = UUID.randomUUID().toString()+ ".jpg";//随机数生成自动编码的名字
			else if(fileContentType.equals("image/gif"))
				customerPhotoFileName = UUID.randomUUID().toString()+ ".gif";
			else if(fileContentType.equals("image/png"))
				customerPhotoFileName = UUID.randomUUID().toString()+ ".png";
			
			File file=new File(path,customerPhotoFileName);
			byte[] b=new byte[1024];
			int bs=0;
			while((bs=is.read(b))>0){
				os.write(b,0,bs);
			}
			is.close();
			os.close();
		}
		if(customerPhoto!=null)
			customer.setFilepath("images/"+customerPhotoFileName);
		else
			customer.setFilepath("images/NoImage.jpg");
		customerDao.AddCustomer(customer);
		
		customerDao.AddCustomer(customer);
		session.put("customer", customer);
		return "show_view";
	}
	
	
	
	public String login() {
		
		ArrayList<Customer> listCustomer = customerDao.QueryCustomerInfo(customer.getName());
		if(listCustomer.size()==0) { 
			
			this.errMessage = "账号不存在";
			System.out.print(this.errMessage);
			return "input";
			
		} 
		else{			
		    Customer db_customer = listCustomer.get(0); //当用户名不允许重名时才这样写
			if(!db_customer.getPassword().equals(customer.getPassword())) {
			
			this.errMessage = " 密码不正确 ";
			System.out.print(this.errMessage);
			return "input";
			
		    }else{
			
			session.put("customer", db_customer); //用户名放到session中
			//跳转前的页面从session中取出来，取出来后将其置空
			prePage = (String) session.get("prePage");
			System.out.println("？？？"+ prePage);
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



}
