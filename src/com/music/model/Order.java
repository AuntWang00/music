package com.music.model;

/**
 * Order entity. @author MyEclipse Persistence Tools
 */

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

	public Integer getOrderid() {
		return this.orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Songs getSongs() {
		return this.songs;
	}

	public void setSongs(Songs songs) {
		this.songs = songs;
	}

	public Integer getSongnum() {
		return this.songnum;
	}

	public void setSongnum(Integer songnum) {
		this.songnum = songnum;
	}

	public Double getTotal() {
		return this.total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

}