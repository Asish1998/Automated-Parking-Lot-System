package com.myproject.myapp.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="parkinglotinfo")
public class ParkingLotInfo {
	
	@Id
	@GeneratedValue
	private Long id;
	@Column
	private String name;
	@Column
	private String p_longitude;
	@Column
	private String p_latitude;
	@Column
	private Long price;
	
	
	

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getP_longitude() {
		return p_longitude;
	}
	public void setP_longitude(String p_longitude) {
		this.p_longitude = p_longitude;
	}
	public String getP_latitude() {
		return p_latitude;
	}
	public void setP_latitude(String p_latitude) {
		this.p_latitude = p_latitude;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	
	
	
}
