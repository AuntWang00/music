package com.music.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import java.util.List;
import com.music.dao.SongsDao;
import com.music.model.Customer;
import com.music.model.Songs;
import com.opensymphony.xwork2.ActionSupport;



@Controller @Scope("prototype")
public class SongsAction extends ActionSupport{
	
	/*业务层对象 将songsDao注入*/
	@Resource SongsDao songsDao;
	
	private Songs song;
	
	public Songs getSong() {
		return song;
	}
	
	public void setSong(Songs song) {
		this.song = song;
	}
	
	private List<Songs> songslist;
	
	public List<Songs> getSongslist() {
		return songslist;
	}
	
	public void setSongslist(List<Songs> songslist) {
		this.songslist = songslist;
	}
	
	public String addSong() throws Exception{
		
		songsDao.addSong(song);
		return "message";
	}
	
	public String showSong(){
		songslist = songsDao.QueryAllSongs();
		return "show_view";
	}
	
	public String showDetail(){
		song =songsDao.GetSongById(song.getSongid());
		return "detail_view";
	}
	
	public String showEdit() throws Exception{
		song = songsDao.GetSongById(song.getSongid());
		return "edit_view";
		
		
	}
	public String editSong() throws Exception{
		songsDao.updateSong(song);
		return "edit_message";
		
	}
	public String deleteSong() throws Exception{
		songsDao.deleteSong(song.getSongid());
		return "delete_message";
		
	}
	public String querySongs() throws Exception{
		songslist = songsDao.QuerySongsInfo(keywords);
		return "show_view";
	}
	
	private String keywords;
	
	public String getKeywords() {
		return keywords;
	}
	
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	
	private Customer customer;
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}

	


