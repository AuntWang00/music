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
 * Order entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "music_order", catalog = "music")
public class Order implements java.io.Serializable {

	// Fields

	private Integer orderid;
	private Customer customer;
	private Songs songs;
	private Integer songnum;
	private Double total;

	// Constructors

	/** default constructor */
	public Order() {
	}

	/** minimal constructor */
	public Order(Songs songs) {
		this.songs = songs;
	}

	/** full constructor */
	public Order(Customer customer, Songs songs, Integer songnum, Double total) {
		this.customer = customer;
		this.songs = songs;
		this.songnum = songnum;
		this.total = total;
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
	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@ManyToOne(fetch = FetchType.EAGER)
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

	public void setTotal(Double total) {
		this.total = total;
	}

}