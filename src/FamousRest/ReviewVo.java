package FamousRest;

public class ReviewVo {
	private Long reviewNo;
	private Long restNo;
	private String content;
	private int userRating;
	private String creationDate;
	private String userID;
	
	public ReviewVo (Long reviewNo, Long restNo, String content, int userRating, String creationDate, String userID){
		super();
		this.reviewNo = reviewNo;
		this.restNo = restNo;
		this.content = content;
		this.userRating = userRating;
		this.creationDate = creationDate;
		this.userID = userID;
	}

	public Long getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(Long reviewNo) {
		this.reviewNo = reviewNo;
	}
	public Long getRestNo() {
		return restNo;
	}
	public void setRestNo(Long restNo) {
		this.restNo = restNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getUserRating() {
		return userRating;
	}
	public void setUserRating(int userRating) {
		this.userRating = userRating;
	}
	public String getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
}
