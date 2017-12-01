package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.MessageMapper;
import vo.MessageVO;

@Component
public class MessageDao {
	@Autowired
	private SqlSessionTemplate session;

	public int send(MessageVO message) {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		return mapper.sendMessage(message);
	}

	public List<MessageVO> list(String loginId) {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		return mapper.selectMessage(loginId);
	}

	public int delete(int messageNum) {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		return mapper.deleteMessage(messageNum);
	}

	public MessageVO selectOnlyMessage(int messageNum, String loginId) {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		return mapper.selectOnlyMessage(messageNum, loginId);
	}
}
