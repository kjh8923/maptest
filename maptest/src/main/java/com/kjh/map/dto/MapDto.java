package com.kjh.map.dto;

public class MapDto {
	private int mId;
	private String latitude;
	private String longitude;
	private String placeName;
	private String category;
	private String placecount;
	
	public MapDto() {
		super();
	}
	public MapDto(int mId, String latitude, String longitude, String placeName, String category, String placecount) {
		super();
		this.mId = mId;
		this.latitude = latitude;
		this.longitude = longitude;
		this.placeName = placeName;
		this.category = category;
		this.placecount = placecount;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPlacecount() {
		return placecount;
	}
	public void setPlacecount(String placecount) {
		this.placecount = placecount;
	}
	

}
