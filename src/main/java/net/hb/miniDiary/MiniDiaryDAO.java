package net.hb.miniDiary;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class MiniDiaryDAO {
	
	  @Autowired
	  SqlSessionTemplate temp;
	  
	  public void diaryInsert(MiniDiaryDTO dto) {
			temp.insert("mini_diary.insert", dto);
	  }//end
	  
	  public List<MiniDiaryDTO> diaryList() {
		  
		  List<MiniDiaryDTO> a = temp.selectList("mini_diary.selectAll") ;
		  return a;
	}
	  
	  public List<MiniDiaryDTO> diaryList(int start, int end) {
		  MiniDiaryDTO dto = new MiniDiaryDTO();
		  dto.setStart(start);
		  dto.setEnd(end);
		  List<MiniDiaryDTO> a = temp.selectList("mini_diary.selectAllPaging",dto) ;
		  return a;
	}
	  
	  public List<MiniDiaryDTO> diaryReplytList(int i) {
		  
		  List<MiniDiaryDTO> a = temp.selectList("mini_diary.selectReplyAll") ;
		  return a;
	  }
	  
	  public int diaryCount() {
		  
		  int a = temp.selectOne("mini_diary.selectCount") ;
		  return a;
	  }
		
	  
	  public void diaryDelete(int code) {
			temp.delete("mini_diary.delete", code);
	}//end
	  public void diaryreplyDelete(int code) {
			temp.delete("mini_diary.replydelete", code);
	}//end
	  public void diaryupdate(int code, String title, String content) {
		  MiniDiaryDTO dto = new MiniDiaryDTO();
		  dto.setD_code(code);
		  dto.setD_title(title);
		  dto.setD_content(content);
		  temp.update("mini_diary.update", dto);
	}//end
	  public void reply_insert(String name, String cmt, int code) {
		  MiniDiaryDTO dto = new MiniDiaryDTO();
		  System.out.println(name);
		  System.out.println(cmt);
		  System.out.println(code);
		  
		  dto.setDr_content(cmt);
		  dto.setDr_writer(name);
		  dto.setDr_code(code);
		  temp.insert("mini_diary.replyinsert", dto);
		  System.out.println("추가 성공");
	}
}//class MiniDiaryDAO END
