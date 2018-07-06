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
	private Set<Comme> commes = new HashSet<Comme>(0);
	private Set<Comme> commes_1 = new HashSet<Comme>(0);

	// Constructors

	/** default constructor */
	public Music_order() {
	}

	/** full constructor */
	public Music_order(Music_customer music_customer, Songs songs,
			Integer songnum, Double total, Integer song, Set<Comme> commes,
			Set<Comme> commes_1) {
		this.music_customer = music_customer;
		this.songs = songs;
		this.songnum = songnum;
		this.total = total;
		this.song = song;
		this.commes = commes;
		this.commes_1 = commes_1;
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

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "customer")
	public Music_customer getMusic_customer() {
		return this.music_customer;
	}

	public void setMusic_customer(Music_customer music_customer) {
		this.music_customer = music_customer;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "songs",nullable=false)
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

	public void setTotal(Double total) {
		this.total = total;
	}

	@Column(name = "song")
	public Integer getSong() {
		return this.song;
	}

	public void setSong(Integer song) {
		this.song = song;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "music_order")
	public Set<Comme> getCommes() {
		return this.commes;
	}

	public void setCommes(Set<Comme> commes) {
		this.commes = commes;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "music_order")
	public Set<Comme> getCommes_1() {
		return this.commes_1;
	}

	public void setCommes_1(Set<Comme> commes_1) {
		this.commes_1 = commes_1;
	}

}