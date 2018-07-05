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
 * Comme entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "comment", catalog = "music")
public class Comme implements java.io.Serializable {

	// Fields

	private Integer comid;
	private Music_order music_order;
	private Music_customer music_customer;
	private Songs songs;
	private String comme;

	// Constructors

	/** default constructor */
	public Comme() {
	}

	/** full constructor */
	public Comme(Music_order music_order, Music_customer music_customer,
			Songs songs, String comme) {
		this.music_order = music_order;
		this.music_customer = music_customer;
		this.songs = songs;
		this.comme = comme;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "comid", unique = true, nullable = false)
	public Integer getComid() {
		return this.comid;
	}

	public void setComid(Integer comid) {
		this.comid = comid;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ord", nullable = false)
	public Music_order getMusic_order() {
		return this.music_order;
	}

	public void setMusic_order(Music_order music_order) {
		this.music_order = music_order;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "customer", nullable = false)
	public Music_customer getMusic_customer() {
		return this.music_customer;
	}

	public void setMusic_customer(Music_customer music_customer) {
		this.music_customer = music_customer;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "songs", nullable = false)
	public Songs getSongs() {
		return this.songs;
	}

	public void setSongs(Songs songs) {
		this.songs = songs;
	}

	@Column(name = "comme", nullable = false, length = 1000)
	public String getComme() {
		return this.comme;
	}

	public void setComme(String comme) {
		this.comme = comme;
	}

}