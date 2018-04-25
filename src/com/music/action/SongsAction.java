package com.music.action;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.music.dao.CustomerDao;
import com.music.dao.SongsDao;

import com.music.model.Music_customer;
import com.music.model.Songs;
import com.opensymphony.xwork2.ActionSupport;



@SuppressWarnings("serial")
@Controller @Scope("prototype")
public class SongsAction extends ActionSupport{
	
	/*业务层对象 将songsDao注入*/
	@Resource SongsDao songsDao;
	@Resource CustomerDao customerDao;
	private Music_customer customer1;
	private Songs song;
	 private File songPhoto;
	 private Map<String,Object> session;
	 private String songPhotoFileName;
	 private String songPhotoContentType;
	 private List<Songs> songslist;
	
	public Songs getSong() {
		return song;
	}
	
	public void setSong(Songs song) {
		this.song = song;
	}
	
	
	
	public List<Songs> getSongslist() {
		return songslist;
	}
	
	public void setSongslist(List<Songs> songslist) {
		this.songslist = songslist;
	}
	
	public String addSong() throws Exception{
		String path = ServletActionContext.getServletContext().getRealPath("/upload"); 
        /*处理图片上传*/
        String SongPhotoFileName = ""; 
   	 	if(songPhoto!= null) {
   	 		InputStream is = new FileInputStream(songPhoto);
   			String fileContentType = this.getSongPhotoContentType();
   			System.out.println(fileContentType);
   			if(fileContentType.equals("image/jpeg")  || fileContentType.equals("image/pjpeg"))
   				songPhotoFileName = UUID.randomUUID().toString() +  ".jpg";
   			else if(fileContentType.equals("image/gif"))
   				songPhotoFileName = UUID.randomUUID().toString() +  ".gif";
   			else if(fileContentType.equals("image/png"))
   				songPhotoFileName = UUID.randomUUID().toString() +  ".png";

   			File file = new File(path, songPhotoFileName);
   			OutputStream os = new FileOutputStream(file);
   			byte[] b = new byte[1024];
   			int bs = 0;
   			while ((bs = is.read(b)) > 0) {
   				os.write(b, 0, bs);
   			}
   			is.close();
   			os.close();
   	 	}
        if(songPhoto != null)
        	song.setFilepath("upload/" + songPhotoFileName);
        else
        	song.setFilepath("upload/NoImage.jpg");
        
		
		songsDao.addSong(song);
		return "message";
	}
	
	public String showSong(){
		songslist = songsDao.QueryAllSongs();
		return "show_view";
	}
	

		
	/*
    public String showOrder() {
    	
        //将系统设定为用户名不重复，因此在系统中查询到第一个该名称用户即可
    	System.out.println(customer.getName());
        Customer cus= customerDao.QueryCustomerInfo(customer.getName()).get(0);
        //注意不需要food的查询条件时，下面语句的写法，直接将food的条件置为null
        orderList = orderDao.QueryOrderInfo(cus,null);

        return "show_view";
    }
*/
	public String showSong1(){
		songslist = songsDao.QueryAllSongs();
		return "show_view1";
	}	

	public String showDetail(){
		song =songsDao.GetSongById(song.getSongid());
		return "detail_view";
	}
	
	public String showEdit() throws Exception{
		song = songsDao.GetSongById(song.getSongid());
		return "edit_view";		
	}
	
	public String showAdd() throws Exception{
		
		return "add_view";		
	}
	
	public String editSong() throws Exception{
		String path = ServletActionContext.getServletContext().getRealPath("/upload"); 
        /*处理图片上传*/
        String SongPhotoFileName = ""; 
   	 	if(songPhoto!= null) {
   	 		InputStream is = new FileInputStream(songPhoto);
   			String fileContentType = this.getSongPhotoContentType();
   			System.out.println(fileContentType);
   			if(fileContentType.equals("image/jpeg")  || fileContentType.equals("image/pjpeg"))
   				songPhotoFileName = UUID.randomUUID().toString() +  ".jpg";
   			else if(fileContentType.equals("image/gif"))
   				songPhotoFileName = UUID.randomUUID().toString() +  ".gif";
   			else if(fileContentType.equals("image/png"))
   				songPhotoFileName = UUID.randomUUID().toString() +  ".png";

   			File file = new File(path, songPhotoFileName);
   			OutputStream os = new FileOutputStream(file);
   			byte[] b = new byte[1024];
   			int bs = 0;
   			while ((bs = is.read(b)) > 0) {
   				os.write(b, 0, bs);
   			}
   			is.close();
   			os.close();
   	 	}
        if(songPhoto != null)
        	song.setFilepath("upload/" + songPhotoFileName);
        else
        	song.setFilepath("upload/NoImage.jpg");
        
		
		songsDao.updateSong(song);
		return "edit_message";
		
	}
	public String deleteSong() throws Exception{
		songsDao.deleteSong(song.getSongid());
		
		return "delete_message";
		
	}
	
	
	public String querySongs() throws Exception{
		System.out.println("辣鸡，我在查歌啦");
		songslist = songsDao.QuerySongsInfo(keywords);
		return "show_view";
	}
	
	/*
	public String queryMySongs() throws Exception{
		System.out.println("辣鸡，我在你的查歌啦");
		songslist = songsDao.QueryMySongsInfo(customer);
		return "show_view1";
	}
	*/
	 
	private String keywords;
	
	public String getKeywords() {
		return keywords;
	}
	
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	
	private Music_customer customer;
	public Music_customer getCustomer() {
		return customer1;
	}
	public void setCustomer(Music_customer customer) {
		this.customer1 = customer;
	}

	public File getSongPhoto() {
		return songPhoto;
	}

	public void setSongPhoto(File songPhoto) {
		this.songPhoto = songPhoto;
	}

	public String getSongPhotoFileName() {
		return songPhotoFileName;
	}

	public void setSongPhotoFileName(String songPhotoFileName) {
		this.songPhotoFileName = songPhotoFileName;
	}

	public String getSongPhotoContentType() {
		return songPhotoContentType;
	}

	public void setSongPhotoContentType(String songPhotoContentType) {
		this.songPhotoContentType = songPhotoContentType;
	}

	public SongsDao getSongsDao() {
		return songsDao;
	}

	public void setSongsDao(SongsDao songsDao) {
		this.songsDao = songsDao;
	}

	public CustomerDao getCustomerDao() {
		return customerDao;
	}

	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	public Music_customer getCustomer1() {
		return customer1;
	}

	public void setCustomer1(Music_customer customer1) {
		this.customer1 = customer1;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
		

}
