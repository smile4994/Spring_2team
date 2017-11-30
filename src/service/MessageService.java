package service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.MessageDao;
import vo.MessageVO;

@Component
public class MessageService {
	@Autowired
	private MessageDao dao;
	
	public int send(String receiver, String content, String loginId) {
		MessageVO message = new MessageVO();
		message.setWriteDate(new Date());
		message.setContent(content);
		message.setReceiver(receiver);
		message.setSender(loginId);
		return dao.send(message);
	}
	public List<MessageVO> list(String loginId){
		return dao.list(loginId);
	}
	public int delete(int messageNum, String loginId) {
		MessageVO message = dao.selectOnlyMessage(messageNum, loginId);
		if(message.getReceiver().equals(loginId)) {
			return dao.delete(messageNum);
		}else {
			return 0;
		}
	}
}
