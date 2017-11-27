package repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.BoardVO;

public interface BoardMapper {
	public List<BoardVO> selectList();
	public BoardVO select(int boardNum);
	public int insert(BoardVO board);
	public int update(BoardVO board);
	public int updateRef(int boardNum);
	public int delete(int ref);
	public int updateCount(int boardNum);
	
	
	//검색 창에 입력시 반영되는 select문
	//(1)제목
	public List<BoardVO> selectTitle(String title);
	//(2)작성자
	public List<BoardVO> selectWriter(String writer);
	//(3)카테고리
	public List<BoardVO> selectKategorie(String kategorie);
	
	
	
	
	
	//댓글을 위한 SQL문 
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
}
