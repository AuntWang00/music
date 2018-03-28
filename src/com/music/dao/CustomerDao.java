package com.music.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.music.model.Customer;


@Service @Transactional
public class CustomerDao {
	@Resource SessionFactory factory;
	
	 /*添加Customer信息*/
    public void AddCustomer(Customer customer) throws Exception {
    	Session s = factory.getCurrentSession();
    	System.out.println(customer);
    	s.save(customer);
    }
    
    /*删除Customer信息*/
    public void DeleteCustomer (Integer customerid) throws Exception {
        Session s = factory.getCurrentSession(); 
        Object customer = s.load(Customer.class, customerid);
        s.delete(customer);
    }
    
    /*更新Customer信息*/
    public void UpdateCustomer(Customer customer) throws Exception {
        Session s = factory.getCurrentSession();
        s.update(customer);
    }
    
    /*查询所有Customer信息*/
    public ArrayList<Customer> QueryAllCustomer() {
        Session s = factory.getCurrentSession();
        String hql = "From Customer";
        Query q = s.createQuery(hql);
        List customerList = q.list();
        return (ArrayList<Customer>) customerList;
    }

    /*根据主键获取对象*/
    public Customer GetCustomerById(Integer customerid) {
        Session s = factory.getCurrentSession();
        Customer customer = (Customer)s.get(Customer.class, customerid);
        return customer;
    }
    
    /*根据查询条件查询*/
    public ArrayList<Customer> QueryCustomerInfo(String name) { 	
    	Session s = factory.getCurrentSession();
    	List customerList;
    	String hql = "From Customer customer where 1=1";
    	if(!name.equals("")){ 
    		hql = hql + " and customer.name like '%" + name + "%'";
	    	Query q = s.createQuery(hql);
	    	customerList = q.list();
	    	
    	}else{
    		
    	    customerList =null;	
    	
    	}
    	
    	return (ArrayList<Customer>) customerList;
    }

}

