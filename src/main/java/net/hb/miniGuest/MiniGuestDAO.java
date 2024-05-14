package net.hb.miniGuest;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import net.hb.miniPhoto.MiniPhotoDTO;

@Repository
@Component
public class MiniGuestDAO {
	
  @Autowired
  SqlSessionTemplate temp;
  
  public List<MiniGuestDTO> miniGuestSelect(int start, int end) {
	  MiniGuestDTO dto = new MiniGuestDTO();
	  dto.setStart(start);
	  dto.setEnd(end);
	  return temp.selectList("mini_guest.selectAll", dto);
  }//end
  
  public void miniGuestInsert(MiniGuestDTO dto) {
	  temp.insert("mini_guest.add", dto);
  }//end
  
  public int miniGuestCount() {
	  return temp.selectOne("mini_guest.countAll");
  }//end
  
  public void miniGuestDelete(int idx) {
	  temp.delete("mini_guest.delete", idx);
  }//end
  
}//class MiniGuestDAO END
