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
	static ArrayList<Songs> hotsongs = null;
	
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
    
    public ArrayList<Songs> QueryNewSongs() {
        Session s = factory.getCurrentSession();
        String hql = "From Songs";
        Query q = s.createQuery(hql);
        List songslist = q.list();
        while(songslist.size()>5)
        	songslist.remove(0);
        return (ArrayList<Songs>) songslist;
    }
    
    public static void quickSort(int[] a) {  
        if(a.length>0) {  
            quickSort(a, 0 , a.length-1);  
        }  
    }  
    
    private static void quickSort(int[] a, int low, int high) {  
        //1,找到递归算法的出口  
        if( low > high) {  
            return;  
        }  
        //2, 存  
        int i = low;  
        int j = high;  
        //3,key  
        int key = a[ low ];  
        //4，完成一趟排序  
        while( i< j) {  
            //4.1 ，从右往左找到第一个小于key的数  
            while(i<j && a[j] > key){  
                j--;  
            }  
            // 4.2 从左往右找到第一个大于key的数  
            while( i<j && a[i] <= key) {  
                i++;  
            }  
            //4.3 交换  
            if(i<j) {  
                int p = a[i];  
                a[i] = a[j];  
                a[j] = p; 
                Songs temp =  hotsongs.get(i);
                hotsongs.set(i,hotsongs.get(j));
                hotsongs.set(j,temp);    
            }  
        }  
        // 4.4，调整key的位置  
        int p = a[i];  
        a[i] = a[low];  
        a[low] = p;  
        //5, 对key左边的数快排  
        quickSort(a, low, i-1 );  
        //6, 对key右边的数快排  
        quickSort(a, i+1, high);  
    }  
    
    public ArrayList<Songs> QueryHotSongs() {
        Session s = factory.getCurrentSession();
        String hql = "From Songs";
        Query q = s.createQuery(hql);
        List songslist = q.list();
        
        hotsongs = (ArrayList<Songs>) songslist;
        int [] a = new int[songslist.size()];
        for(int i=0;i<songslist.size();i++){
        	Songs element = (Songs) songslist.get(i);
        	a[i] = element.getBofangliang();
        }
        quickSort(a);
        songslist = hotsongs;
        while(songslist.size()>13){
        	songslist.remove(0);
        }     	
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
