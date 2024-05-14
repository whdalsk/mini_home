package net.hb.miniDiary;

public class MiniDiaryDTO {
	// 게시글 (다이어리)
	int d_code;
	String d_name;
	String d_title;
	String d_content;
	java.util.Date d_wdate;
	int start, end , rn;

	// 댓글(더아오라)
	int dr_num;
	String dr_writer;
	String dr_content;
	int dr_code;
	
	// 게시글 게터 세터
	public int getD_code() {
		return d_code;
	}
	public void setD_code(int d_code) {
		this.d_code = d_code;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public String getD_title() {
		return d_title;
	}
	public void setD_title(String d_title) {
		this.d_title = d_title;
	}
	public String getD_content() {
		return d_content;
	}
	public void setD_content(String d_content) {
		this.d_content = d_content;
	}
	public java.util.Date getD_wdate() {
		return d_wdate;
	}
	public void setD_wdate(java.util.Date d_wdate) {
		this.d_wdate = d_wdate;
	}
	
	// 댓글의 게터 세터 
	public int getDr_num() {
		return dr_num;
	}
	public void setDr_num(int dr_num) {
		this.dr_num = dr_num;
	}
	public String getDr_writer() {
		return dr_writer;
	}
	public void setDr_writer(String dr_writer) {
		this.dr_writer = dr_writer;
	}
	public String getDr_content() {
		return dr_content;
	}
	public void setDr_content(String dr_content) {
		this.dr_content = dr_content;
	}
	public int getDr_code() {
		return dr_code;
	}
	public void setDr_code(int dr_code) {
		this.dr_code = dr_code;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
}// class MiniDiaryDTO END
