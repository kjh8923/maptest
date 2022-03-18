package com.kjh.map.dto;

public class MapDto {
	private int mId;
	private String latitude;
	private String longitude;
	private String placeName;
	private String ind;
	public MapDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MapDto(int mId, String latitude, String longitude, String placeName, String ind) {
		super();
		this.mId = mId;
		this.latitude = latitude;
		this.longitude = longitude;
		this.placeName = placeName;
		this.ind = ind;
	}
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getInd() {
		return ind;
	}
	public void setInd(String ind) {
		this.ind = ind;
	}
	

	

}
