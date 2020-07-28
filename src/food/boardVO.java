package food;

public class boardVO {
   private Long no;
   private String title;
   private String username;
   private String boardcontent;
   private String pubdate;
   private Long likeup;
   
   public boardVO(Long no,String title,String username,String boardcontent,String pubdate,Long likeup) {
	   this.no=no;
	   this.title=title;
	   this.username=username;
	   this.boardcontent=boardcontent;
	   this.pubdate=pubdate;
	   this.likeup=likeup;
   }
   public Long getNo() {
      return no;
   }
   public void setNo(Long no) {
      this.no = no;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getUsername() {
      return username;
   }
   public void setUsername(String username) {
      this.username = username;
   }
   public String getBoardcontent() {
      return boardcontent;
   }
   public void setBoardcontent(String boardcontent) {
      this.boardcontent = boardcontent;
   }
   public String getPubdate() {
      return pubdate;
   }
   public void setPubdate(String pubdate) {
      this.pubdate = pubdate;
   }
   public Long getLikeup() {
      return likeup;
   }
   public void setLikeup(Long likeup) {
      this.likeup = likeup;
   }
}