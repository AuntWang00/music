package com.music.action;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.music.dao.CustomerDao;
import com.music.model.Customer;
import com.mysql.jdbc.PreparedStatement;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


@Controller @Scope("prototype")
//@Results(value = { @Result(name = "fail", value = "/checkPerfail.jsp") })
public class CustomerAction extends ActionSupport implements SessionAware{
	
@Resource CustomerDao customerDao;
    
    private Customer customer;
    
    private Map<String,Object> session;
	private String prePage;

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
