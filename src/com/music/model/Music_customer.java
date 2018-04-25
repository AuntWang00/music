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
 * Music_customer entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "music_customer", catalog = "music")
public class Music_customer implements java.io.Serializable {

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
	private Set<Music_order> music_orders = new HashSet<Music_order>(0);
	private Set<Music_order> music_orders_1 = new HashSet<Music_order>(0);
	private Set<Music_order> music_orders_2 = new HashSet<Music_order>(0);
	private Set<Music_order> music_orders_3 = new HashSet<Music_order>(0);

	// Constructors

	/** default constructor */
	public Music_customer() {
	}

	/** minimal constructor */
	public Music_customer(String password) {
		this.password = password;
	}

	/** full constructor */
	public Music_customer(String sex, String name, String realname,
			String password, Integer songsnum, String filepath,
			String birthday, String country, String albumname, Integer number,
			String bab, Set<Music_order> music_orders,
			Set<Music_order> music_orders_1, Set<Music_order> music_orders_2,
			Set<Music_order> music_orders_3) {
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
		this.music_orders = music_orders;
		this.music_orders_1 = music_orders_1;
		this.music_orders_2 = music_orders_2;
		this.music_orders_3 = music_orders_3;
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

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "music_customer")
	public Set<Music_order> getMusic_orders() {
		return this.music_orders;
	}

	public void setMusic_orders(Set<Music_order> music_orders) {
		this.music_orders = music_orders;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "music_customer")
	public Set<Music_order> getMusic_orders_1() {
		return this.music_orders_1;
	}

	public void setMusic_orders_1(Set<Music_order> music_orders_1) {
		this.music_orders_1 = music_orders_1;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "music_customer")
	public Set<Music_order> getMusic_orders_2() {
		return this.music_orders_2;
	}

	public void setMusic_orders_2(Set<Music_order> music_orders_2) {
		this.music_orders_2 = music_orders_2;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "music_customer")
	public Set<Music_order> getMusic_orders_3() {
		return this.music_orders_3;
	}

	public void setMusic_orders_3(Set<Music_order> music_orders_3) {
		this.music_orders_3 = music_orders_3;
	}

}