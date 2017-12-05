package vo;

public class API_MemberVO {
	private int memberNum;
	private String id;
	private String name;
	private String nickname;
	private String email;
	///////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public API_MemberVO(int memberNum, String id, String name, String nickname, String email) {
		super();
		this.memberNum = memberNum;
		this.id = id;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
	}
	
	public API_MemberVO() {
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	///////////////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public String toString() {
		return "API_MemberVO [memberNum=" + memberNum + ", id=" + id + ", name=" + name + ", nickname=" + nickname
				+ ", email=" + email + "]";
	}

	///////////////////////////////////////////////////////////////////////////////////////////////////////
	
}
