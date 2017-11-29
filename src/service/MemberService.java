package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.MemberDao;
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

}
