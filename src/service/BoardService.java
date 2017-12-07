package service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.BoardDao;
import repository.MemberDao;
import vo.BoardPageVO;
import vo.BoardVO;
import vo.ReplyVO;

@Component
public class BoardService {
	@Autowired
	private BoardDao dao;
	
	@Autowired
	private MemberDao mDao;
	//////////////////////////////////////////////////////
	// 한 페이지에 보여질 글의 갯수
	private static final int COUNT_PER_PAGE = 10;

	public BoardPageVO makeBoardPage(String searchType,String searchWrite,int currentPage) {
		// 게시글 총 갯수
		int totalCount = 0;
		if(searchType.equals("1")) {
			totalCount = dao.selectTitleCount(searchWrite);
		}else if(searchType.equals("2")) {
			totalCount = dao.selectWriterCount(searchWrite);
		}else if(searchType.equals("3")) {
			totalCount = dao.selectKategorieCount(searchWrite);
		}else {
			totalCount = dao.selectCount();
		}

		// 총 페이지수 계산
		int totalPage = totalCount / COUNT_PER_PAGE;
		if (totalCount % COUNT_PER_PAGE != 0) {
			totalPage++;
		}

		// 화면 하단의 페이지 링크(시작)
		int startPage = (currentPage - 1) / 10 * 10 + 1;
		
		// 화면 하단의 페이지 링크(끝)
		int endPage = startPage + 9;
		if (totalPage < endPage) {
			endPage = totalPage;
		}

		// 글 조회 행 시작 번호 계산
		int startRow = (currentPage - 1) * COUNT_PER_PAGE;

		// DB에서 보여질 게시글 목록 조회
		List<BoardVO> boardList;
		if(searchType.equals("1")) {
			boardList = dao.selectTitle(startRow, COUNT_PER_PAGE, searchWrite);
		}else if(searchType.equals("2")) {
			boardList = dao.selectWriter(startRow, COUNT_PER_PAGE, searchWrite);
		}else if(searchType.equals("3")) {
			boardList = dao.selectKategorie(startRow, COUNT_PER_PAGE, searchWrite);
		}else {
			boardList = dao.selectList(startRow, COUNT_PER_PAGE);
		}
		// 모든 데이터 BoardPageVO 객체에 담아서 리턴
		return new BoardPageVO(boardList, currentPage, startPage, endPage, totalPage);
	}

	/////////////////////////////////////////////////////////////////////////////

//	public List<BoardVO> svBoardList(String searchType, String searchWrite) {
//		if (searchType.equals("1")) {
//			// System.out.println("svBoardList 1번실행");
//			List<BoardVO> boardList = dao.selectTitle(searchWrite);
//			return boardList;
//		} else if (searchType.equals("2")) {
//			// System.out.println("svBoardList 2번실행");
//			List<BoardVO> boardList = dao.selectWriter(searchWrite);
//			return boardList;
//		} else if (searchType.equals("3")) {
//			// System.out.println("svBoardList 3번실행");
//			List<BoardVO> boardList = dao.selectKategorie(searchWrite);
//			return boardList;
//		} else {
//			// System.out.println("svBoardList 0번실행");
//			List<BoardVO> boardList = dao.selectList();
//			return boardList;
//		}
//	}

	public boolean svInsert(BoardVO board, String loginId) {
		board.setDate(new Date());
		board.setWriter(loginId);
		if (dao.insert(board) == 1) {
			int boardNum = board.getBoardNum();
			dao.updateRef(boardNum);
			return true;
		} else {
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
		if (minStep > 0) {
			board.setStep(minStep);
			dao.updateStep(board);
			board.setDate(new Date());
			board.setWriter(loginId);
			dao.insertReple(board);
			result = 1;
			return result;
		} else {
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
		if (dao.update(board) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public int svDelete(BoardVO board) {
		int result = 0;
		result = dao.checkSelect(board);

		/* 이거 어차피 부모 step이 0 이면 원글이니까 step==0 일때 delete실행하면 돼 */
		if (board.getStep() == 0) {
			dao.delete(board.getRef());
			return result;
		} else if (result != 0) {
			int minStep = result;
			dao.deleteReple(board.getStep(), minStep);
			return result;
		} else {
			int maxStep = dao.maxStep(board.getRef());
			dao.deleteReple(board.getStep(), maxStep);
			return result;
		}
	}

	public boolean svUpdateCount(int boardNum, String loginId) {
		BoardVO board = dao.select(boardNum);
		if (board.getWriter().equals(loginId)) {
			return false;
		} else {
			dao.updateCount(boardNum);
			return true;
		}
	}

	// 여기서부터 리플에 작업

	// public List<reply>
	// (1)리플 전체 리스트
	public List<ReplyVO> svReplyList(int boardNum) {
		List<ReplyVO> replyList = dao.selectReplyList(boardNum);
		
		return replyList;
	}

	// (2)리플 삽입
	public boolean svReplyInsert(int boardNum, ReplyVO reply, String loginId) {
		reply.setRe_src(mDao.selectMember(loginId).getMemberSrc()); 
		reply.setRe_date(new Date());
		reply.setRe_writer(loginId);
		reply.setRe_ref(boardNum);
		if (dao.insertReply(reply) == 1) {
			return true;
		} else {
			return false;
		}
	}

	// (3)리플 삭제
	public boolean svReplyDelete(int replyNum) {
		if (dao.deleteReply(replyNum) == 1) {
			return true;
		} else {
			return false;
		}
	}

	// (4)원글 삭제시 전체삭제
	public boolean svReplyAllDelete(int replyNum) {
		if (dao.deleteAllReply(replyNum) == 1) {
			return true;
		} else {
			return false;
		}
	}

	// (5)리플1개의 정보
	public ReplyVO svReplySelect(int replyNum) {
		ReplyVO reply = new ReplyVO();
		reply = dao.selectReply(replyNum);
		return reply;
	}
	
	/******************gallery에서 보여질 리스트******************/
	public List<BoardVO> svSelectGallery(){
		List<BoardVO> boardList = dao.selectGallery();
		return boardList;
	}
	/******************main에서 보여질 리스트******************/
	public List<BoardVO> svSelectMain(){
		List<BoardVO> boardList = dao.selectMain();
		return boardList;
	}

}
