package com.music.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * Music_order entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "music_order", catalog = "music")
public class Music_order implements java.io.Serializable {

	// Fields

	private Integer orderid;
	private Music_customer music_customer;
	private Songs songs;
	private Integer songnum;
	private Double total;
	private Integer song;

	// Constructors

	/** default constructor */
	public Music_order() {
	}

	/** minimal constructor */
	public Music_order(Songs songs) {
		this.songs = songs;
	}

	/** full constructor */
	public Music_order(Music_customer music_customer, Songs songs,
			Integer songnum, Double total, Integer song) {
		this.music_customer = music_customer;
		this.songs = songs;
		this.songnum = songnum;
		this.total = total;
		this.song = song;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "orderid", unique = true, nullable = false)
	public Integer getOrderid() {
		return this.orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "customer")
	public Music_customer getMusic_customer() {
		return this.music_customer;
	}

	public void setMusic_customer(Music_customer music_customer) {
		this.music_customer = music_customer;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "songs", nullable = false)
	public Songs getSongs() {
		return this.songs;
	}

	public void setSongs(Songs songs) {
		this.songs = songs;
	}

	@Column(name = "songnum")
	public Integer getSongnum() {
		return this.songnum;
	}

	public void setSongnum(Integer songnum) {
		this.songnum = songnum;
	}

	@Column(name = "total", precision = 22, scale = 0)
	public Double getTotal() {
		return this.total;
	}

	public void setTotal(long l) {
		this.total = (double) l;
	}

	@Column(name = "song")
	public Integer getSong() {
		return this.song;
	}

	public void setSong(Integer song) {
		this.song = song;
	}

}