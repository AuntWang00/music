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
	
	 /*添加Customer信息*/
    public void AddCustomer(Music_customer customer) throws Exception {
    	Session s = factory.getCurrentSession();
    	System.out.println("customer:"+customer);
    	s.save(customer);
    }
    
    /*删除Customer信息*/
    public void DeleteCustomer (Integer customerid) throws Exception {
        Session s = factory.getCurrentSession(); 
        Object customer = s.load(Music_customer.class, customerid);
        s.delete(customer);
    }
    
    /*更新Customer信息*/
    public void UpdateCustomer(Music_customer customer) throws Exception {
        Session s = factory.getCurrentSession();
        s.update(customer);
    }
    
    /*查询所有Customer信息*/
    public ArrayList<Music_customer> QueryAllCustomer() {
        Session s = factory.getCurrentSession();
        String hql = "From Music_customer";
        Query q = s.createQuery(hql);
        List customerList = q.list();
        return (ArrayList<Music_customer>) customerList;
    }

    /*根据主键获取对象*/
    public Music_customer GetCustomerById(Integer customerid) {
        Session s = factory.getCurrentSession();
        Music_customer customer = (Music_customer)s.get(Music_customer.class, customerid);
        return customer;
    }
    
    /*根据查询条件查询*/
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