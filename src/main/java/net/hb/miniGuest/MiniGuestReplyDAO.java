package net.hb.miniGuest;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


@Repository
@Component
public class MiniGuestReplyDAO {
	
  @Autowired
  SqlSessionTemplate temp;
  
  public List<MiniGuestReplyDTO> guestReplySelect(int idx){
	  return temp.selectList("mini_guest_reply.selectAll", idx);
  }//end
  
  public void guestReplyInsert(MiniGuestReplyDTO dto, String data) {
	  dto.setGr_writer(data);
	  temp.insert("mini_guest_reply.add", dto);
  }//end
  
}//class MiniGuestReplyDAO END
