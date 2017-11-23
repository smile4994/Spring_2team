package vo;

import java.util.Date;

public class BoardVO {
	private int boardNum;
	private String title;
	private String contents;
	private String writer;
	private Date date;
	private int count;
	private int ref;
	private int indent;
	private int step;
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	@Override
	public String toString() {
		return "BoardVO [boardNum=" + boardNum + ", title=" + title + ", contents=" + contents + ", writer=" + writer
				+ ", date=" + date + ", count=" + count + ", ref=" + ref + ", indent=" + indent + ", step=" + step
				+ "]";
	}
	
	
}
