package service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.BoardDao;
import vo.BoardVO;

@Component
public class BoardService {
	@Autowired
	private BoardDao dao;
	
	public List<BoardVO> svBoardList(String searchType, String searchWrite){
		
//		System.out.println("써비스에서 searchType : " +searchType);
//		System.out.println("써비스에서 searchWrite : " +searchWrite);
		
		if(searchType.equals("1")) {
//			System.out.println("svBoardList 1번실행");
			List<BoardVO> boardList = dao.selectTitle(searchWrite);
			return boardList;
		}else if(searchType.equals("2")) {
//			System.out.println("svBoardList 2번실행");
			List<BoardVO> boardList = dao.selectWriter(searchWrite);
			return boardList;
		}else if(searchType.equals("3")){
//			System.out.println("svBoardList 3번실행");
			List<BoardVO> boardList = dao.selectList();
			return boardList;
		}else {
//			System.out.println("svBoardList 0번실행");
			List<BoardVO> boardList = dao.selectList();
			return boardList;
		}
		
		
	}
	public boolean svInsert(BoardVO board, String loginId) {
		board.setDate(new Date());
		board.setWriter(loginId);
		if(dao.insert(board)==1) {
			int boardNum = board.getBoardNum();
			dao.updateRef(boardNum);
			return true;
		}else {
			return false;
		}
	}
	
	public BoardVO svSelect(int boardNum) {
		BoardVO board = dao.select(boardNum);
		return board;
	}
	
	public int svInsertReple(BoardVO board, String loginId) {
		int result = 0;
		int minStep = dao.checkSelect(board);
		if(minStep > 0) {
			board.setStep(minStep);
			dao.updateStep(board);
			board.setDate(new Date());
			board.setWriter(loginId);
			dao.insertReple(board);
			result = 1;
			return result;
		}else {
			int maxStep = dao.maxStep(board.getRef());
			board.setDate(new Date());
			board.setWriter(loginId);
			board.setStep(maxStep);
			dao.insertReple(board);
			result = 0;
			return result;
		}
	}
	
	public boolean svUpdate(BoardVO board) {
		board.setDate(new Date());
		if(dao.update(board) == 1) {
			return true;
		}else {
			return false;
		}
	}

	public int svDelete(BoardVO board) {
		int result = 0;
		result = dao.checkSelect(board);
		
		/*이거 어차피 부모 step이 0 이면 원글이니까 step==0 일때 delete실행하면 돼 */
		if(board.getStep()==0) {
			dao.delete(board.getRef());
			return result;
		}else if(result != 0){
			int minStep = result;
			dao.deleteReple(board.getStep(), minStep);
			return result;
		}else {
			int maxStep = dao.maxStep(board.getRef());
			dao.deleteReple(board.getStep(), maxStep);
			return result;
		}
	}
	
	public boolean svUpdateCount(int boardNum,String loginId) {
		BoardVO board = dao.select(boardNum);
		if(board.getWriter().equals(loginId)) {
			return false;
		}else {
			dao.updateCount(boardNum);
			return true;
		}
	}
	
}
