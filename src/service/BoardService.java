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
	// �� �������� ������ ���� ����
	private static final int COUNT_PER_PAGE = 10;

	public BoardPageVO makeBoardPage(String searchType,String searchWrite,int currentPage) {
		// �Խñ� �� ����
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

		// �� �������� ���
		int totalPage = totalCount / COUNT_PER_PAGE;
		if (totalCount % COUNT_PER_PAGE != 0) {
			totalPage++;
		}

		// ȭ�� �ϴ��� ������ ��ũ(����)
		int startPage = (currentPage - 1) / 10 * 10 + 1;
		
		// ȭ�� �ϴ��� ������ ��ũ(��)
		int endPage = startPage + 9;
		if (totalPage < endPage) {
			endPage = totalPage;
		}

		// �� ��ȸ �� ���� ��ȣ ���
		int startRow = (currentPage - 1) * COUNT_PER_PAGE;

		// DB���� ������ �Խñ� ��� ��ȸ
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
		// ��� ������ BoardPageVO ��ü�� ��Ƽ� ����
		return new BoardPageVO(boardList, currentPage, startPage, endPage, totalPage);
	}

	/////////////////////////////////////////////////////////////////////////////

//	public List<BoardVO> svBoardList(String searchType, String searchWrite) {
//		if (searchType.equals("1")) {
//			// System.out.println("svBoardList 1������");
//			List<BoardVO> boardList = dao.selectTitle(searchWrite);
//			return boardList;
//		} else if (searchType.equals("2")) {
//			// System.out.println("svBoardList 2������");
//			List<BoardVO> boardList = dao.selectWriter(searchWrite);
//			return boardList;
//		} else if (searchType.equals("3")) {
//			// System.out.println("svBoardList 3������");
//			List<BoardVO> boardList = dao.selectKategorie(searchWrite);
//			return boardList;
//		} else {
//			// System.out.println("svBoardList 0������");
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

		/* �̰� ������ �θ� step�� 0 �̸� �����̴ϱ� step==0 �϶� delete�����ϸ� �� */
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

	// ���⼭���� ���ÿ� �۾�

	// public List<reply>
	// (1)���� ��ü ����Ʈ
	public List<ReplyVO> svReplyList(int boardNum) {
		List<ReplyVO> replyList = dao.selectReplyList(boardNum);
		
		return replyList;
	}

	// (2)���� ����
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

	// (3)���� ����
	public boolean svReplyDelete(int replyNum) {
		if (dao.deleteReply(replyNum) == 1) {
			return true;
		} else {
			return false;
		}
	}

	// (4)���� ������ ��ü����
	public boolean svReplyAllDelete(int replyNum) {
		if (dao.deleteAllReply(replyNum) == 1) {
			return true;
		} else {
			return false;
		}
	}

	// (5)����1���� ����
	public ReplyVO svReplySelect(int replyNum) {
		ReplyVO reply = new ReplyVO();
		reply = dao.selectReply(replyNum);
		return reply;
	}
	
	/******************gallery���� ������ ����Ʈ******************/
	public List<BoardVO> svSelectGallery(){
		List<BoardVO> boardList = dao.selectGallery();
		return boardList;
	}
	/******************main���� ������ ����Ʈ******************/
	public List<BoardVO> svSelectMain(){
		List<BoardVO> boardList = dao.selectMain();
		return boardList;
	}

}
