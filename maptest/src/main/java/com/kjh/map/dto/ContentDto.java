package com.kjh.map.dto;

public class ContentDto {
	private int mId;
	private String title;
	private String content;
	private String latitude;
	private String longitude;
	private String placeName;
	private String placeName2;
	
	public ContentDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ContentDto(int mId, String title, String content, String latitude, String longitude, String placeName,
			String placeName2) {
		super();
		this.mId = mId;
		this.title = title;
		this.content = content;
		this.latitude = latitude;
		this.longitude = longitude;
		this.placeName = placeName;
		this.placeName2 = placeName2;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getPlaceName2() {
		return placeName2;
	}

	public void setPlaceName2(String placeName2) {
		this.placeName2 = placeName2;
	}
	
	
}
