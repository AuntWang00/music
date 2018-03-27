package com.music.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * Singer entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "singer", catalog = "music")
public class Singer implements java.io.Serializable {

	// Fields

	private Integer singerid;
	private String singername;

	// Constructors

	/** default constructor */
	public Singer() {
	}

	/** full constructor */
	public Singer(String singername) {
		this.singername = singername;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "singerid", unique = true, nullable = false)
	public Integer getSingerid() {
		return this.singerid;
	}

	public void setSingerid(Integer singerid) {
		this.singerid = singerid;
	}

	@Column(name = "singername", nullable = false, length = 40)
	public String getSingername() {
		return this.singername;
	}

	public void setSingername(String singername) {
		this.singername = singername;
	}

}