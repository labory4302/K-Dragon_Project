package food;

public class commentVO {
	private Long no;
	   private String username;
	   private String bcomment;
	   private String pubdate;
	   
	   public commentVO(Long no,String username,String bcomment,String pubdate) {
		   this.no=no;
		   this.username=username;
		   this.bcomment=bcomment;
		   this.pubdate=pubdate;
	   }
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBcomment() {
		return bcomment;
	}
	public void setBcomment(String bcomment) {
		this.bcomment = bcomment;
	}
	public String getPubdate() {
		return pubdate;
	}
	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}
	   
	   
}
