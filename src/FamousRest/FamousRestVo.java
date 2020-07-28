package FamousRest;

public class FamousRestVo implements Comparable<FamousRestVo> {
	private Long restNo;			//맛집등록번호
	private String restName;		//맛집이름
	private String category;		//업종
	private float rating;				//등급
	private String address;			//주소
	private String phoneNumber;		//맛집전화번호
	private int priceRange;			//가격대
	private String parkingStatus;	//주차가능여부
	private String deliveryStatus;	//배달가능여부
	private String startBusiness;	//영업시작시간
	private String closeBusiness;	//영업종료시간
	private String menu;			//주요메뉴
	
	public FamousRestVo() {}
	
	public FamousRestVo(Long restNo, String restName, String category, float rating, String address,
						String phoneNumber, int priceRange, String parkingStatus, String deliveryStatus,
						String startBusiness, String closeBusiness, String menu) {
		super();
		this.restNo = restNo;
		this.restName = restName;
		this.category = category;
		this.rating = rating;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.priceRange = priceRange;
		this.parkingStatus = parkingStatus;
		this.deliveryStatus = deliveryStatus;
		this.startBusiness = startBusiness;
		this.closeBusiness = closeBusiness;
		this.menu = menu;
	}
	
	public String getRestNoImage() {
		return Long.toString(restNo);
	}
	public Long getRestNo() {
		return restNo;
	}
	public void setRestNo(Long restNo) {
		this.restNo = restNo;
	}
	public String getRestName() {
		return restName;
	}
	public void setRestName(String restName) {
		this.restName = restName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getPriceRange() {
		return priceRange;
	}
	public void setPriceRange(int priceRange) {
		this.priceRange = priceRange;
	}
	public String getParkingStatus() {
		return parkingStatus;
	}
	public void setParkingStatus(String parkingStatus) {
		this.parkingStatus = parkingStatus;
	}
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	public String getStartBusiness() {
		return startBusiness.substring(startBusiness.length()-8, startBusiness.length()-3);
	}
	public void setStartBusiness(String startBusiness) {
		this.startBusiness = startBusiness;
	}
	public String getCloseBusiness() {
		return closeBusiness.substring(closeBusiness.length()-8, closeBusiness.length()-3);
	}
	public void setCloseBusiness(String closeBusiness) {
		this.closeBusiness = closeBusiness;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	
	@Override
    public int compareTo(FamousRestVo s) {
        if (this.rating > s.getRating()) {
            return -1;
        } else if (this.rating < s.getRating()) {
            return 1;
        }
        return 0;
    }
}
