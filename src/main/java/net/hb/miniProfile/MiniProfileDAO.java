package net.hb.miniProfile;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import net.hb.miniHome.MiniHomeDTO;

@Repository
@Component
public class MiniProfileDAO {
	
  @Autowired
  SqlSessionTemplate temp;
  
  public MiniProfileDTO mini_profileDetail(String p_id) {
	  MiniProfileDTO dto = temp.selectOne("mini_profile.detail", p_id);
	  return dto;
   }//end
  
  
  
}//class MiniProfileDAO END
