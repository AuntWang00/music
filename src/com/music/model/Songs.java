package com.music.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Songs entity. @author MyEclipse Persistence Tools
 */

public class Songs implements java.io.Serializable {

	// Fields

	private Integer songid;
	private String songname;
	private Double price;
	private Set orders = new HashSet(0);
	private Set orders_1 = new HashSet(0);

	// Constructors

	/** default constructor */
	public Songs() {
	}

	/** full constructor */
	public Songs(String songname, Double price, Set orders, Set orders_1) {
		this.songname = songname;
		this.price = price;
		this.orders = orders;
		this.orders_1 = orders_1;
	}

	// Property accessors

	public Integer getSongid() {
		return this.songid;
	}

	public void setSongid(Integer songid) {
		this.songid = songid;
	}

	public String getSongname() {
		return this.songname;
	}

	public void setSongname(String songname) {
		this.songname = songname;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Set getOrders() {
		return this.orders;
	}

	public void setOrders(Set orders) {
		this.orders = orders;
	}

	public Set getOrders_1() {
		return this.orders_1;
	}

	public void setOrders_1(Set orders_1) {
		this.orders_1 = orders_1;
	}

}