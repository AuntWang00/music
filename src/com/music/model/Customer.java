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
	private String sex;
	private String name;
	private String realname;
	private String password;
	private Integer songsnum;
	private String filepath;
	private String birthday;
	private String country;
	private String albumname;
	private Integer number;
	private String bab;
	private Set<Order> orders = new HashSet<Order>(0);
	private Set<Order> orders_1 = new HashSet<Order>(0);
	private Set<Order> orders_2 = new HashSet<Order>(0);

	// Constructors

	/** default constructor */
	public Customer() {
	}

	/** minimal constructor */
	public Customer(String password) {
		this.password = password;
	}

	/** full constructor */
	public Customer(String sex, String name, String realname, String password,
			Integer songsnum, String filepath, String birthday, String country,
			String albumname, Integer number, String bab, Set<Order> orders,
			Set<Order> orders_1, Set<Order> orders_2) {
		this.sex = sex;
		this.name = name;
		this.realname = realname;
		this.password = password;
		this.songsnum = songsnum;
		this.filepath = filepath;
		this.birthday = birthday;
		this.country = country;
		this.albumname = albumname;
		this.number = number;
		this.bab = bab;
		this.orders = orders;
		this.orders_1 = orders_1;
		this.orders_2 = orders_2;
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

	@Column(name = "sex", length = 10)
	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Column(name = "name", length = 30)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "realname", length = 30)
	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	@Column(name = "password", nullable = false, length = 30)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "songsnum")
	public Integer getSongsnum() {
		return this.songsnum;
	}

	public void setSongsnum(Integer songsnum) {
		this.songsnum = songsnum;
	}

	@Column(name = "filepath", length = 100)
	public String getFilepath() {
		return this.filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	@Column(name = "birthday", length = 30)
	public String getBirthday() {
		return this.birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	@Column(name = "country", length = 30)
	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Column(name = "albumname", length = 20)
	public String getAlbumname() {
		return this.albumname;
	}

	public void setAlbumname(String albumname) {
		this.albumname = albumname;
	}

	@Column(name = "number")
	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	@Column(name = "bab", length = 30)
	public String getBab() {
		return this.bab;
	}

	public void setBab(String bab) {
		this.bab = bab;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "customer")
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "customer")
	public Set<Order> getOrders_1() {
		return this.orders_1;
	}

	public void setOrders_1(Set<Order> orders_1) {
		this.orders_1 = orders_1;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "customer")
	public Set<Order> getOrders_2() {
		return this.orders_2;
	}

	public void setOrders_2(Set<Order> orders_2) {
		this.orders_2 = orders_2;
	}

}