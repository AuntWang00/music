package com.music.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * Songs entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "songs", catalog = "music")
public class Songs implements java.io.Serializable {

	// Fields

	private Integer songid;
	private String songname;
	private Double price;
	private String filepath;
	private String album;
	private String language;
	private String lyrics;
	private String singer;
	private String audiopath;
	private Integer bofangliang;
	private Set<Music_order> music_orders = new HashSet<Music_order>(0);
	private Set<Music_order> music_orders_1 = new HashSet<Music_order>(0);
	private Set<Comme> commes = new HashSet<Comme>(0);
	private Set<Music_order> music_orders_2 = new HashSet<Music_order>(0);
	private Set<Music_order> music_orders_3 = new HashSet<Music_order>(0);
	private Set<Comme> commes_1 = new HashSet<Comme>(0);

	// Constructors

	/** default constructor */
	public Songs() {
	}

	/** minimal constructor */
	public Songs(String filepath) {
		this.filepath = filepath;
	}

	/** full constructor */
	public Songs(String songname, Double price, String filepath, String album,
			String language, String lyrics, String singer, String audiopath,
			Integer bofangliang, Set<Music_order> music_orders,
			Set<Music_order> music_orders_1, Set<Comme> commes,
			Set<Music_order> music_orders_2, Set<Music_order> music_orders_3,
			Set<Comme> commes_1) {
		this.songname = songname;
		this.price = price;
		this.filepath = filepath;
		this.album = album;
		this.language = language;
		this.lyrics = lyrics;
		this.singer = singer;
		this.audiopath = audiopath;
		this.bofangliang = bofangliang;
		this.music_orders = music_orders;
		this.music_orders_1 = music_orders_1;
		this.commes = commes;
		this.music_orders_2 = music_orders_2;
		this.music_orders_3 = music_orders_3;
		this.commes_1 = commes_1;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "songid", unique = true, nullable = false)
	public Integer getSongid() {
		return this.songid;
	}

	public void setSongid(Integer songid) {
		this.songid = songid;
	}

	@Column(name = "songname", length = 100)
	public String getSongname() {
		return this.songname;
	}

	public void setSongname(String songname) {
		this.songname = songname;
	}

	@Column(name = "price", precision = 22, scale = 0)
	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Column(name = "filepath", nullable = false, length = 100)
	public String getFilepath() {
		return this.filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	@Column(name = "album", length = 50)
	public String getAlbum() {
		return this.album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

	@Column(name = "language", length = 10)
	public String getLanguage() {
		return this.language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	@Column(name = "lyrics", length = 8000)
	public String getLyrics() {
		return this.lyrics;
	}

	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}

	@Column(name = "singer", length = 50)
	public String getSinger() {
		return this.singer;
	}

	public void setSinger(String singer) {
		this.singer = singer;
	}

	@Column(name = "audiopath", length = 100)
	public String getAudiopath() {
		return this.audiopath;
	}

	public void setAudiopath(String audiopath) {
		this.audiopath = audiopath;
	}

	@Column(name = "bofangliang")
	public Integer getBofangliang() {
		return this.bofangliang;
	}

	public void setBofangliang(Integer bofangliang) {
		this.bofangliang = bofangliang;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "songs")
	public Set<Music_order> getMusic_orders() {
		return this.music_orders;
	}

	public void setMusic_orders(Set<Music_order> music_orders) {
		this.music_orders = music_orders;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "songs")
	public Set<Music_order> getMusic_orders_1() {
		return this.music_orders_1;
	}

	public void setMusic_orders_1(Set<Music_order> music_orders_1) {
		this.music_orders_1 = music_orders_1;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "songs")
	public Set<Comme> getCommes() {
		return this.commes;
	}

	public void setCommes(Set<Comme> commes) {
		this.commes = commes;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "songs")
	public Set<Music_order> getMusic_orders_2() {
		return this.music_orders_2;
	}

	public void setMusic_orders_2(Set<Music_order> music_orders_2) {
		this.music_orders_2 = music_orders_2;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "songs")
	public Set<Music_order> getMusic_orders_3() {
		return this.music_orders_3;
	}

	public void setMusic_orders_3(Set<Music_order> music_orders_3) {
		this.music_orders_3 = music_orders_3;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "songs")
	public Set<Comme> getCommes_1() {
		return this.commes_1;
	}

	public void setCommes_1(Set<Comme> commes_1) {
		this.commes_1 = commes_1;
	}

}