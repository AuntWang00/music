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
	private Integer singer;
	private Set<Order> orders = new HashSet<Order>(0);
	private Set<Order> orders_1 = new HashSet<Order>(0);
	private Set<Order> orders_2 = new HashSet<Order>(0);

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
			String language, String lyrics, Integer singer, Set<Order> orders,
			Set<Order> orders_1, Set<Order> orders_2) {
		this.songname = songname;
		this.price = price;
		this.filepath = filepath;
		this.album = album;
		this.language = language;
		this.lyrics = lyrics;
		this.singer = singer;
		this.orders = orders;
		this.orders_1 = orders_1;
		this.orders_2 = orders_2;
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

	@Column(name = "singer")
	public Integer getSinger() {
		return this.singer;
	}

	public void setSinger(Integer singer) {
		this.singer = singer;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "songs")
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "songs")
	public Set<Order> getOrders_1() {
		return this.orders_1;
	}

	public void setOrders_1(Set<Order> orders_1) {
		this.orders_1 = orders_1;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "songs")
	public Set<Order> getOrders_2() {
		return this.orders_2;
	}

	public void setOrders_2(Set<Order> orders_2) {
		this.orders_2 = orders_2;
	}

}