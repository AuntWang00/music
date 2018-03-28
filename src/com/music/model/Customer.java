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
 * Customer entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "music_customer", catalog = "music")
public class Customer implements java.io.Serializable {

	// Fields

	private Integer customerid;
	private String name;
	private Integer number;
	private String password;
	private Set<Order> musicOrders = new HashSet<Order>(0);
	private Set<Order> musicOrders_1 = new HashSet<Order>(0);
	private Set<Order> musicOrders_2 = new HashSet<Order>(0);

	// Constructors

	/** default constructor */
	public Customer() {
	}

	/** minimal constructor */
	public Customer(String name, Integer number, String password) {
		this.name = name;
		this.number = number;
		this.password = password;
	}

	/** full constructor */
	public Customer(String name, Integer number, String password,
			Set<Order> musicOrders, Set<Order> musicOrders_1,
			Set<Order> musicOrders_2) {
		this.name = name;
		this.number = number;
		this.password = password;
		this.musicOrders = musicOrders;
		this.musicOrders_1 = musicOrders_1;
		this.musicOrders_2 = musicOrders_2;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "customerid", unique = true, nullable = false)
	public Integer getCustomerid() {
		return this.customerid;
	}

	public void setCustomerid(Integer customerid) {
		this.customerid = customerid;
	}

	@Column(name = "name", nullable = false, length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "number", nullable = false)
	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	@Column(name = "password", nullable = false, length = 40)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "customer")
	public Set<Order> getMusicOrders() {
		return this.musicOrders;
	}

	public void setMusicOrders(Set<Order> musicOrders) {
		this.musicOrders = musicOrders;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "customer")
	public Set<Order> getMusicOrders_1() {
		return this.musicOrders_1;
	}

	public void setMusicOrders_1(Set<Order> musicOrders_1) {
		this.musicOrders_1 = musicOrders_1;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "customer")
	public Set<Order> getMusicOrders_2() {
		return this.musicOrders_2;
	}

	public void setMusicOrders_2(Set<Order> musicOrders_2) {
		this.musicOrders_2 = musicOrders_2;
	}

}