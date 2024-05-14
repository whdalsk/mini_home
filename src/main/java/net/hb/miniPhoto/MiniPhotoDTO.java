package net.hb.miniPhoto;

import org.springframework.web.multipart.MultipartFile;

public class MiniPhotoDTO {
	int p_code;
	String p_name;
	String p_title;
	String p_content;
	java.util.Date p_wdate;
	String p_img;
	MultipartFile upload_f;
	
	String pnum="1";
	int pageNUM, pagecount; 
	int start, end;
	int startpage, endpage;
	int temp;
	String skey;
	String sval;
	int rcnt;
	
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public java.util.Date getP_wdate() {
		return p_wdate;
	}
	public void setP_wdate(java.util.Date p_wdate) {
		this.p_wdate = p_wdate;
	}
	public MultipartFile getUpload_f() {
		return upload_f;
	}
	public void setUpload_f(MultipartFile upload_f) {
		this.upload_f = upload_f;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public int getPageNUM() {
		return pageNUM;
	}
	public void setPageNUM(int pageNUM) {
		this.pageNUM = pageNUM;
	}
	public int getPagecount() {
		return pagecount;
	}
	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
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
	public int getStartpage() {
		return startpage;
	}
	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}
	public int getEndpage() {
		return endpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	public int getTemp() {
		return temp;
	}
	public void setTemp(int temp) {
		this.temp = temp;
	}
	public String getSkey() {
		return skey;
	}
	public void setSkey(String skey) {
		this.skey = skey;
	}
	public String getSval() {
		return sval;
	}
	public void setSval(String sval) {
		this.sval = sval;
	}
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	
	
}// class MiniPhotoDTO END
