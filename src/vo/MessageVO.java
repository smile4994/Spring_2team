package vo;

import java.util.Date;

public class MessageVO {
	private int messageNum;
	private String sender;
	private String receiver;
	private String content;
	private Date writeDate;
	
	public int getMessageNum() {
		return messageNum;
	}
	public void setMessageNum(int messageNum) {
		this.messageNum = messageNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public MessageVO(int messageNum, String content, String sender, String receiver, Date writeDate) {
		this.messageNum = messageNum;
		this.content = content;
		this.sender = sender;
		this.receiver = receiver;
		this.writeDate = writeDate;
	}
	public MessageVO() {
	}
	@Override
	public String toString() {
		return "MessageVO [messageNum=" + messageNum + ", content=" + content + ", sender=" + sender + ", receiver="
				+ receiver + ", writeDate=" + writeDate + "]";
	}
	
	
}
