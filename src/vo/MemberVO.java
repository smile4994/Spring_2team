package vo;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private int memberNum;
	private String id;
	private String pw;
	private String email;
	private String phone;
	private String name;
	private String address;
	private String memberSrc;
    private MultipartFile memImg;
	
	public MultipartFile getMemImg() {
		return memImg;
	}
	public void setMemImg(MultipartFile memImg) {
		this.memImg = memImg;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMemberSrc() {
		return memberSrc;
	}
	public void setMemberSrc(String memberSrc) {
		this.memberSrc = memberSrc;
	}
	@Override
	public String toString() {
		return "MemberVO [memberNum=" + memberNum + ", id=" + id + ", pw=" + pw + ", email=" + email + ", phone="
				+ phone + ", name=" + name + ", address=" + address + ", memberSrc=" + memberSrc + ", memberImg : "+memImg+"]";
	}
	public MemberVO(int memberNum, String id, String pw, String email, String phone, String name, String address,
			String memberSrc) {
		this.memberNum = memberNum;
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.phone = phone;
		this.name = name;
		this.address = address;
		this.memberSrc = memberSrc;
	}
	public MemberVO() {
	}
	
	
	
}
