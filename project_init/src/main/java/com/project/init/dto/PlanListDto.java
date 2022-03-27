package com.project.init.dto;


public class PlanListDto {
	private int planNum;
	private int planListNum;
	private String latitude;
	private String longitude;
	private String placeName;
	private String placeCount;
	private String category;
	private String address;
	private String planDetail;
	private String transportation;
	private String startTime;
	private String endTime;
	public PlanListDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PlanListDto(int planNum, int planListNum, String latitude, String longitude, String placeName,
			String placeCount, String category, String address, String planDetail, String transportation,
			String startTime, String endTime) {
		super();
		this.planNum = planNum;
		this.planListNum = planListNum;
		this.latitude = latitude;
		this.longitude = longitude;
		this.placeName = placeName;
		this.placeCount = placeCount;
		this.category = category;
		this.address = address;
		this.planDetail = planDetail;
		this.transportation = transportation;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	public int getPlanNum() {
		return planNum;
	}
	public void setPlanNum(int planNum) {
		this.planNum = planNum;
	}
	public int getPlanListNum() {
		return planListNum;
	}
	public void setPlanListNum(int planListNum) {
		this.planListNum = planListNum;
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
	public String getPlaceCount() {
		return placeCount;
	}
	public void setPlaceCount(String placeCount) {
		this.placeCount = placeCount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPlanDetail() {
		return planDetail;
	}
	public void setPlanDetail(String planDetail) {
		this.planDetail = planDetail;
	}
	public String getTransportation() {
		return transportation;
	}
	public void setTransportation(String transportation) {
		this.transportation = transportation;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	

}
