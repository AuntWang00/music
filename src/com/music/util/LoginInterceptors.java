package com.music.util;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.music.model.Customer;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptors extends AbstractInterceptor{

	 
	   private static final long serialVersionUID = 1L;

	   private String sessionName;

	   private String excludeName;
	   
	   private List <String> list;
	   /*
	    * ��Ϊ�������ļ��Ĳ���excludeName�У������action���������ɸ����м��ö��ż����
	    * ������ȡֵʱҪ��excludeName�ֽ�ɵ�����һ����action�����֣�����һ��list�У�strlist���������ֽ���Щaction������
	    * ���綺��ǰ���пո�ʹ��trim()����ȥ����Щ�ո�
	    */
	   public List<String>  strlsit(String str){

	     String[] s = str.split(",");

	     List <String> list = new ArrayList <String>();

	     for(String ss : s){

	        list.add(ss.trim());

	     }

	     return list;

	   }

	   @Override
	   //��������ʼ��ʱ�������action����list��
	   public void init() {

	      list = strlsit(excludeName);

	   }
	   
	   //����init()
	   //�̳�destroy()
	   //intercept����,�Լ���д

	   @Override

	   public String intercept(ActionInvocation invocation) throws Exception {

	     
		 System.out.println("--------����������-------");  
		 String actionName = invocation.getProxy().getActionName();   
		 Map <String,Object>  session = invocation.getInvocationContext().getSession(); 
		 System.out.println(list);
	     if(list.contains(actionName)){   
	        
	    	System.out.println(actionName + "û�б�����");
	        return invocation.invoke();     

	     }else {   

	        
	    	System.out.println(actionName + "ѽ��������");

	        
	       
	        Customer customer = (Customer) session.get(sessionName);   
	        
	           if(customer==null){  
	        	     
	                 HttpServletRequest req = ServletActionContext.getRequest();  

	                
	                 String path = req.getRequestURI().replaceAll("/music", "");
	                 System.out.println("path:" + path);
	        
	                 //����session�����������struts.xml�л���Ϊ��������
	                 session.put("prePage", path);  
	        	     return "login";
	           }
	           else {                
	        	
	                 return invocation.invoke();   

	          }

	     }

	   }

	   public String getSessionName() {

	     return sessionName;

	   }

	   public void setSessionName(String sessionName) {

	     this.sessionName = sessionName;

	   }

	   public String getExcludeName() {

	     return excludeName;

	   }

	   public void setExcludeName(String excludeName) {

	     this.excludeName = excludeName;

	   }

	   public List<String> getList() {

	     return list;

	   }

	   public void setList(List<String> list) {

	     this.list = list;

	   }


	}
