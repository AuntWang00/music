 package com.music.action;
import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.music.dao.ComDao;
import com.music.dao.CustomerDao;
import com.music.dao.OrderDao;
import com.music.dao.SongsDao;
import com.music.model.*;

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
public class ComAction extends ActionSupport{
	
	@Resource CustomerDao customerDao;
	@Resource SongsDao songsDao;
	@Resource OrderDao orderDao;
	@Resource ComDao comDao;
	private String customername;
	private Comme com;
    private List<Comme> commentList;
    private Music_customer customer;
    private Map<String,Object> session;
    private Songs songs;
    private int songid;
    private Music_order order;
    private String comme;
    
    public int getSongid(){
    	return songid;
    }
    
    public int setSongid(int songid){
    	return this.songid=songid;
    }
    
    public Comme getCom() {
		return com;
	}
	public void setCom(Comme com) {
		this.com = com;
	}
	public List<Comme> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comme> commentList) {
		this.commentList = commentList;
	}
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
	
	public Songs getSongs() {
		return songs;
	}
	public void setSongs(Songs songs) {
		this.songs = songs;
	}
	public Music_order getOrder() {
		return order;
	}
	public void setOrder(Music_order order) {
		this.order = order;
	}
	public String getComme() {
		return comme;
	}
	public void setComme(String comme) {
		this.comme = comme;
	}
	
	public String addComment() throws Exception{
		System.out.println("a");
		System.out.println(customer.getName()+"1");
		customer = customerDao.QueryCustomerInfo1(customer.getName());
		System.out.println("4");
		//System.out.println(customer.getName());
		Comme com =new Comme();
		com.setMusic_customer(customer);
		com.setSongs(songs);
		com.setMusic_order(order);
		System.out.println(comme+"6");
		if(!(comme.isEmpty())){
			System.out.println("5");
			com.setComme(comme);
		}
		comDao.AddComment(com);
		System.out.println("7");
		
		songs = songsDao.GetSongById(songs.getSongid());
    	order = orderDao.GetOrderById(order.getOrderid());
    	System.out.println("8");
    	
    	commentList = comDao.QueryCommentInfo_g(songs.getSongid());
    	
    	//List<Comme> commentList = comDao.QueryCommentInfo_g(com.getSongs().getSongid());
		System.out.println(commentList);
		System.out.println("9");
		return "comment_success";
		
	}
	public String showCommentu() {	
        commentList = comDao.QueryCommentInfo_u(customer.getCustomerid());
	    return "show_view_u";
	}
	
	public String showCommentg() {
		songs = songsDao.GetSongById(songs.getSongid()); 
       commentList = comDao.QueryCommentInfo_g(songs.getSongid());
        return "show_view_g";
    }
	
	public String showDetail() {
    	songs = songsDao.GetSongById(songs.getSongid());
    	order = orderDao.GetOrderById(order.getOrderid());
    	commentList = comDao.QueryCommentInfo_g(songs.getSongid());
        return "detail_view";
    }
}
