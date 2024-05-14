package net.hb.miniPhoto;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class MiniPhotoDAO {
	
  @Autowired
  SqlSessionTemplate temp;
  
  public List<MiniPhotoDTO> miniPhotoSelect(int start, int end) {
	  MiniPhotoDTO dto = new MiniPhotoDTO();
	  dto.setStart(start);
	  dto.setEnd(end);
	  return temp.selectList("mini_photo.selectAll", dto);
  }//end
  
  public void miniPhotoInsert(MiniPhotoDTO dto) {
	  temp.insert("mini_photo.add", dto);
  }//end
  
  public int miniPhotoCount() {
	  return temp.selectOne("mini_photo.countAll");
  }//end
  
  public void miniPhotoUpdate(MiniPhotoDTO dto) {
	  temp.delete("mini_photo.update", dto);
  }//end
  
  public void miniPhotoDelete(int idx) {
	  temp.delete("mini_photo.delete", idx);
  }//end
  
}//class MiniPhotoDAO END
