package repository.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.BoardVO;
import vo.ReplyVO;

public interface BoardMapper {
//	public List<BoardVO> selectList();
	public BoardVO select(int boardNum);
	public int insert(BoardVO board);
	public int update(BoardVO board);
	public int updateRef(int boardNum);
	public int delete(int ref);
	public int updateCount(int boardNum);

	
	//페이징 처리를 위한 작업
	public List<BoardVO> selectList(@Param("startRow")int startRow, @Param("count")int count);
	public int selectTotalCount();
	public int selectTitleCount(String title);
	public int selectWriterCount(String writer);
	public int selectKategorieCount(String kategorie);
	
	//검색 창에 입력시 반영되는 select문
	//(1)제목
	public List<BoardVO> selectTitle(@Param("startRow")int startRow, @Param("count")int count,@Param("title")String title);
	//(2)작성자
	public List<BoardVO> selectWriter(@Param("startRow")int startRow, @Param("count")int count,@Param("writer")String writer);
	//(3)카테고리
	public List<BoardVO> selectKategorie(@Param("startRow")int startRow, @Param("count")int count,@Param("kategorie")String kategorie);
	

	//답글을 위한 SQL문 
	//(1)댓글 / 대댓 인지 확인하기 
	public int checkSelect(BoardVO board);
	//(2)null값일때 max(step)값을 구해준다
	public int maxStep(int ref);
	//(3)댓글을 작성한다
	public int insertReple(BoardVO board);
	//(4)null값이 아닐때 나머지 step값을 증가시킨다
	public int updateStep(BoardVO board);
	//(5)댓/대댓글을 지우기위한 delete
	public int deleteReple(@Param("step")int step, @Param("minStep")int minStep);
	
	
	//리플을 위한 SQL
	public List<ReplyVO> selectReplyList(int boardNum);
	public ReplyVO selectReply(int replyNum);
	public int insertReply(ReplyVO reply);
	public int deleteReply(int replyNum);
	public int deleteAllReply(int ref);
	public int write(HashMap hm);
	//파일 업로드
	
	
	
}
