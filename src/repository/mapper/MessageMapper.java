package repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.MessageVO;

public interface MessageMapper {
	public int sendMessage(MessageVO message);
	public List<MessageVO> selectMessage(String loginId);
	public MessageVO selectOnlyMessage(@Param("messageNum")int messageNum,@Param("loginId")String loginId);
	public int deleteMessage(int messageNum);
}
