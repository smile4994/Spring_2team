package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.MemberMapper;
import vo.MemberVO;
import vo.MessageVO;

@Component
public class MemberDao {
	@Autowired
	private SqlSessionTemplate session;

	public int insert(MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.insert(member);
	}
	
	public int selectLogin(String id, String password) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.selectLogin(id, password);
	}
	
	public MemberVO selectMember(String id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.selectMember(id);
	}
	public int updateMember(MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.updateMember(member);
	}
	public int deleteMember(int memberNum) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.deleteMember(memberNum);
		
	}
	
}
