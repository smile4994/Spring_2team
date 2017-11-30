package repository.mapper;

import org.apache.ibatis.annotations.Param;

import vo.MemberVO;

public interface MemberMapper {
	public int insert(MemberVO member);
	public MemberVO selectMember(String id);
	public int selectLogin(@Param("id")String id, @Param("pw")String password);
	public int updateMember(MemberVO member);
	public int deleteMember(int memberNum);
}
