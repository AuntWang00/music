package com.music.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.opensymphony.xwork2.ActionInvocation;
import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.music.model.Music_customer;
import com.music.model.Music_order;
import com.music.model.Songs;

@Service @Transactional

public class SongsDao {
	@Resource SessionFactory factory;
	// private static String sessionName;
	 
	public void addSong(Songs song){
		Session s= factory.getCurrentSession();
		s.save(song);
		
	}
	
	public void deleteSong(Integer songid){
		Session s= factory.getCurrentSession();
		Object song= s.load(Songs.class, songid);
		s.delete(song);
		
	}
	
    public void updateSong(Songs song) throws Exception {
        Session s = factory.getCurrentSession();
        s.update(song);
    }
    
    public ArrayList<Songs> QueryAllSongs() {
        Session s = factory.getCurrentSession();
        String hql = "From Songs";
        Query q = s.createQuery(hql);
        List songslist = q.list();
        return (ArrayList<Songs>) songslist;
    }
      
    
    
    
    public Songs GetSongById(Integer songid) {
        Session s = factory.getCurrentSession();
        Songs song = (Songs)s.get(Songs.class, songid);
        return song;
    }
    
    public ArrayList<Songs> QuerySongsInfo(String songname) { 
    	Session s = factory.getCurrentSession();
    	String hql = "From Songs song where 1=1";
    	if(!songname.equals("")) 
    		hql = hql + " and song.songname like '%" + songname + "%'"; //模糊查询 ,不要乱加空格哦
    	System.out.println(hql);
    	Query q = s.createQuery("querySongsInfo"+hql);
    	List<Songs> songslist = q.list();
    	return (ArrayList<Songs>) songslist;
    }
    
    public ArrayList<Songs> QuerySongsInfo1(Music_customer customer, Songs song) {
    	Session s = factory.getCurrentSession();
    	String hql = "From Songs song where 1=1";
    	if(null != customer && customer.getCustomerid()!=0) 
    		hql = hql + " and song.singer.customerid like '%" + customer.getCustomerid() + "%'";
    	if(null != song && null!=song.getSongname()) 
    		hql = hql + " and song.songname like '%" + song.getSongname() + "%'";
    	Query q = s.createQuery(hql);
    	List<Songs> songsList = q.list();
    	return (ArrayList<Songs>) songsList;
    }



}
