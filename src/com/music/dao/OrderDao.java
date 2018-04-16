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
import com.music.model.Music_order;


@Service @Transactional
public class OrderDao {
	@Resource SessionFactory factory;
	
	 
    public void AddOrder(Music_order order) throws Exception {
    	Session s = factory.getCurrentSession();
    	s.save(order);
    }
    
    
    public void DeleteOrder (Integer orderId) throws Exception {
        Session s = factory.getCurrentSession(); 
        Object order = s.load(Music_order.class, orderId);
        s.delete(order);
    }
    
    
    public void UpdateOrder(Music_order order) throws Exception {
        Session s = factory.getCurrentSession();
        s.update(order);
    }
    
    
    public ArrayList<Music_order> QueryAllOrder() {
        Session s = factory.getCurrentSession();
        String hql = "From Music_order";
        Query q = s.createQuery(hql);
        List orderList = q.list();
        return (ArrayList<Music_order>) orderList;
    }

    
    public Music_order GetOrderById(Integer orderid) {
        Session s = factory.getCurrentSession();
        Music_order order = (Music_order)s.get(Music_order.class, orderid);
        return order;
    }
    
    
    public ArrayList<Music_order> QueryOrderInfo(Music_customer customer, Songs song) {
    	Session s = factory.getCurrentSession();
    	String hql = "From Music_order order where 1=1";
    	if(null != customer && customer.getCustomerid()!=0) 
    		hql = hql + " and order.customer.customerid like '%" + customer.getCustomerid() + "%'";
    	if(null != song && null!=song.getSongname()) 
    		hql = hql + " and order.song.songname like '%" + song.getSongname() + "%'";
    	Query q = s.createQuery(hql);
    	List orderList = q.list();
    	return (ArrayList<Music_order>) orderList;
    }

}
