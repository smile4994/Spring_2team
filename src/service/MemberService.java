package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.MemberDao;
import vo.API_MemberVO;
import vo.MemberVO;

@Component
public class MemberService {
	@Autowired
	private MemberDao dao;
	
	//1. 회원가입
	public boolean svJoin(MemberVO member) {
		if(dao.insert(member)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean svlogin(String id, String password) {
		if(dao.selectLogin(id, password)==1) {
			return true;
		}else {
			return false;
		}
	}
	public MemberVO getMemberInfo(String loginId) {
		return dao.selectMember(loginId);
	}
	
	public int updateMember(MemberVO member,String loginId) {
		if(member.getId().equals(loginId)) {
			dao.updateMember(member);
			return 1;
		}
		return 0;
	}
	public int deleteMember(String loginId) {
		MemberVO member = dao.selectMember(loginId);
		if(member.getId().equals(loginId)) {
			return dao.deleteMember(member.getMemberNum());
		}else {
			return 0;
		}
	}
	
	//////////////////////////////////////////////////////////////////////////////////////
	//api
	public boolean apiJoin(API_MemberVO api_member) {
		if(dao.insert(api_member)>0)
		{
			return true;
		}else {
			return false;
		}
	}
	
	public boolean apiLogin(String id) {
		if(dao.selectApiLogin(id)==1) {
			return true;
		}else
		{
			return false;
		}
	}
	
}
