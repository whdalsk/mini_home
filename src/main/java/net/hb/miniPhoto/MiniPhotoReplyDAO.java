package net.hb.miniPhoto;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


@Repository
@Component
public class MiniPhotoReplyDAO {
	
  @Autowired
  SqlSessionTemplate temp;
  
  public List<MiniPhotoReplyDTO> photoReplySelect(int idx) {
	  return temp.selectList("mini_photo_reply.selectAll", idx);
  }//end
  
  public void photoReplyInsert(MiniPhotoReplyDTO dto, String data) {
	  dto.setPr_writer(data);
	  temp.insert("mini_photo_reply.add", dto);
  }//end
  
}//class MiniPhotoReplyDAO END
