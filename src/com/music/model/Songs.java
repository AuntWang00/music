package com.music.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
	private Music_customer music_customer;
	private String songname;
	private Double price;
	private String filepath;
	private String language;
	private String lyrics;
	private String album;
	private Set<Music_order> music_orders = new HashSet<Music_order>(0);
	private Set<Music_order> music_orders_1 = new HashSet<Music_order>(0);
	private Set<Music_order> music_orders_2 = new HashSet<Music_order>(0);
	private Set<Music_order> music_orders_3 = new HashSet<Music_order>(0);

	// Constructors

	/** default constructor */
	public Songs() {
	}

	/** full constructor */
	public Songs(Music_customer music_customer, String songname, Double price,
			String filepath, String language, String lyrics, String album,
			Set<Music_order> music_orders, Set<Music_order> music_orders_1,
			Set<Music_order> music_orders_2, Set<Music_order> music_orders_3) {
		this.music_customer = music_customer;
		this.songname = songname;
		this.price = price;
		this.filepath = filepath;
		this.language = language;
		this.lyrics = lyrics;
		this.album = album;
		this.music_orders = music_orders;
		this.music_orders_1 = music_orders_1;
		this.music_orders_2 = music_orders_2;
		this.music_orders_3 = music_orders_3;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "singer")
	public Music_customer getMusic_customer() {
		return this.music_customer;
	}

	public void setMusic_customer(Music_customer music_customer) {
		this.music_customer = music_customer;
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

	@Column(name = "filepath", length = 100)
	public String getFilepath() {
		return this.filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	@Column(name = "language", length = 10)
	public String getLanguage() {
		return this.language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	@Column(name = "lyrics", length = 16777215)
	public String getLyrics() {
		return this.lyrics;
	}

	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}

	@Column(name = "album", length = 50)
	public String getAlbum() {
		return this.album;
	}

	public void setAlbum(String album) {
		this.album = album;
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

}