package com.music.action;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.*;
import java.util.List;
import java.util.UUID;

import com.music.dao.SongsDao;
import com.music.model.Customer;
import com.music.model.Songs;
import com.opensymphony.xwork2.ActionSupport;



@Controller @Scope("prototype")
public class SongsAction extends ActionSupport{
	
	/*业务层对象 将songsDao注入*/
	@Resource SongsDao songsDao;
	
	private Songs song;
    private File songPhoto;
    private String songPhotoFileName;
    private String songPhotoContentType;
	
	public Songs getSong() {
		return song;
	}
	
	public void setSong(Songs song) {
		this.song = song;
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

	public void setSongPhotoContentType(String SongPhotoContentType) {
		this.songPhotoContentType = songPhotoContentType;
	}
	
	private List<Songs> songslist;
	
	public List<Songs> getSongslist() {
		return songslist;
	}
	
	public void setSongslist(List<Songs> songslist) {
		this.songslist = songslist;
	}

	/* 添加 Song*/
	public String addSong() throws Exception{
		String path = ServletActionContext.getServletContext().getRealPath("/upload");
		/*处理图片上传*/
		String songPhotoFileName ="";
		if(songPhoto != null) {
			InputStream is = new FileInputStream(songPhoto);
			String fileContentType = this.getSongPhotoContentType();
			System.out.println(fileContentType);
			if(fileContentType.equals("image/jpeg") || fileContentType.equals("image/pjpeg"))
				songPhotoFileName = UUID.randomUUID() .toString() + ".jpg";
			else if(fileContentType.equals("image/gif"))
				songPhotoFileName = UUID.randomUUID() .toString() + ".gif";
			else if(fileContentType.equals("image/png"))
				songPhotoFileName = UUID.randomUUID().toString() + ". png";
			
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
			song. setFilepath("upload/" + songPhotoFileName);
		else
			song.setFilepath( "upload/NoImage.jpg");
		
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

	


