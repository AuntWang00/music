package com.music.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.music.model.Music_customer;
import com.music.model.Songs;


@Service @Transactional
public class CustomerDao {
	@Resource SessionFactory factory;
	
	 /*ï¿½ï¿½ï¿½Customerï¿½ï¿½Ï¢*/
    public void AddCustomer(Music_customer customer) throws Exception {
    	Session s = factory.getCurrentSession();
    	System.out.println("customer:"+customer);
    	s.save(customer);
    }
    
    /*É¾ï¿½ï¿½Customerï¿½ï¿½Ï¢*/
    public void DeleteCustomer (Integer customerid) throws Exception {
        Session s = factory.getCurrentSession(); 
        Object customer = s.load(Music_customer.class, customerid);
        s.delete(customer);
    }
    
    /*ï¿½ï¿½ï¿½ï¿½Customerï¿½ï¿½Ï¢*/
    public void UpdateCustomer(Music_customer customer) throws Exception {
        Session s = factory.getCurrentSession();
        s.update(customer);
    }
    
    /*ï¿½ï¿½Ñ¯ï¿½ï¿½ï¿½ï¿½Customerï¿½ï¿½Ï¢*/
    public ArrayList<Music_customer> QueryAllCustomer() {
        Session s = factory.getCurrentSession();
        String hql = "From Music_customer";
        Query q = s.createQuery(hql);
        List customerList = q.list();
        return (ArrayList<Music_customer>) customerList;
    }

    /*ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½È¡ï¿½ï¿½ï¿½ï¿½*/
    public Music_customer GetCustomerById(Integer customerid) {
        Session s = factory.getCurrentSession();
        Music_customer customer = (Music_customer)s.get(Music_customer.class, customerid);
        return customer;
    }
    
    /*¸ù¾Ý²éÑ¯Ìõ¼þ²éÑ¯*/
    @SuppressWarnings("unchecked")
	public ArrayList<Music_customer> QueryCustomerInfo(String name) { 	
    	Session s = factory.getCurrentSession();
    	List<Music_customer> customerList;
    	String hql = "From Music_customer customer where 1=1";
    	if(!name.equals("")){ 
    		hql = hql + " and customer.name like '%" + name + "%'";
	    	Query q = s.createQuery(hql);
	    	customerList = q.list();
	    	
    	}else{   		
    	    customerList =null;	   	
    	}   	
    	return (ArrayList<Music_customer>) customerList;
    }

}