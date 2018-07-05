package com.music.dao;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.music.model.*;

@Service @Transactional
public class ComDao {
	@Resource SessionFactory factory;
	public void AddComment(Comme comme) throws Exception {
    	Session s = factory.getCurrentSession();
    	s.save(comme);
    }
	
	public void DeleteComment (Integer comid) throws Exception {
        Session s = factory.getCurrentSession(); 
        Object comment = s.load(Comme.class, comid);
        s.delete(comment);
    }
	
	public void UpdateComment(Comme com) throws Exception {
        Session s = factory.getCurrentSession();
        s.update(com);
    }
	
	public ArrayList<Comme> QueryAllComment() {
        Session s = factory.getCurrentSession();
        String hql = "From Comment";
        Query q = s.createQuery(hql);
        List commentList = q.list();
        return (ArrayList<Comme>) commentList;
    }
	
	public Comme GetCommentById(Integer commentid) {
        Session s = factory.getCurrentSession();
        Comme comment = (Comme)s.get(Comme.class, commentid);
        return comment;
    }
	
	public ArrayList<Comme> QueryCommentInfo_u(int customerid) { 
    	Session s = factory.getCurrentSession();
    	String hql = "From Comment comment where 1=1";
    	if(customerid!=0) hql = hql + " and comment.customer like '%" + customerid + "%'";
    	Query q = s.createQuery(hql);
    	List commentList = q.list();
    	return (ArrayList<Comme>) commentList;
    }
	
	public ArrayList<Comme> QueryCommentInfo_g(int songs) { 
    	Session s = factory.getCurrentSession();
    	String hql = "From Comme com where 1=1";
    	if(songs!=0) hql = hql + " and com.songs.songid like '%" + songs + "%'";
    	Query q = s.createQuery(hql);
    	List commentList = q.list();
    	return (ArrayList<Comme>) commentList;
    }
	
	public ArrayList<Comme> QueryCommentInfo(Comme com, Songs song) {
    	Session s = factory.getCurrentSession();
    	String hql = "From Comme com where 1=1";
    	if(null != com ) 
    		hql = hql + " and com.songs like '%" + com.getSongs().getSongid() + "%'";
    	Query q = s.createQuery(hql);
    	List comList = q.list();
    	return (ArrayList<Comme>) comList;
    }
	
	
}
