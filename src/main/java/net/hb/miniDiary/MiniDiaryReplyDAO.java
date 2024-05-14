package net.hb.miniDiary;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


@Repository
@Component
public class MiniDiaryReplyDAO {
	
  @Autowired
  SqlSessionTemplate temp;
  
  
  
}//class MiniDiaryReplyDAO END
