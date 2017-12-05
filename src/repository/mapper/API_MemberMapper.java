package repository.mapper;

import org.apache.ibatis.annotations.Param;

import vo.API_MemberVO;

public interface API_MemberMapper {
	public int insert(API_MemberVO member);
	public int selectLogin(@Param("id")String id);
}
