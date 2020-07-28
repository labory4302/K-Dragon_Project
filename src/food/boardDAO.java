package food;
import java.util.List;

import food.boardVO;


public interface boardDAO {
	public List<boardVO> getList(String search);
	public void likeup(Long no, String name);
	public boolean insert(String title, String name, String content);
	public int updatecheck(Long no, String name);
	public void boardUpdate(Long no, String title, String content);
	public void boarddelete(Long no);
	public int likecheck(Long no, String name);
}