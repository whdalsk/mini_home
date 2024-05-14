package net.hb.miniHome;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class MiniHomeDAO {
	
  @Autowired
  SqlSessionTemplate temp;
  
  
  public MiniHomeDTO mini_homeDetail(String m_id) {
	  MiniHomeDTO dto = temp.selectOne("mini_home.detail", m_id);
	  return dto;
  }//end
  
  public List<MiniHomeDTO> ilchonSelect(){
	  return temp.selectList("mini_home.selectAll");
  }//end
  
  public void ilchonInsert(String i_content){
	  temp.insert("mini_home.add", i_content);
  }//end
  
}//class MiniHomeDAO END
