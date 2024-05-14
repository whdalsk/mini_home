package net.hb.miniLogin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class LoginDAO {

	@Autowired
	SqlSessionTemplate temp;
	
	public List<LoginDTO> dbSelect( ){
	  List<LoginDTO> list=temp.selectList("login.selectAll");
	  return list;
	}//end
 
	public String login(LoginDTO dto){
		String dtoReturn=temp.selectOne("login.selectDetail",dto);
		return dtoReturn;
	}//end
	
	//회원가입
	public int signUp(LoginDTO dto) {
		return temp.insert("login.add", dto);
	}//end
	
	//아이디 찾기
	public String find_id(LoginDTO dto) {
		return temp.selectOne("login.find_id", dto);
	}

	//비밀번호 찾기
	public String findPwd(LoginDTO dto) {
		return temp.selectOne("login.find_pwd", dto);
	}//end

}//LoginDAO end
