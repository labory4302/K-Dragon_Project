package food;
import java.util.List;

import food.commentVO;
public interface commentDAO {
	public List<commentVO> getList(Long no);
	public boolean insert(Long no,String comment, String name);
}
