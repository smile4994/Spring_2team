package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.BoardMapper;
import vo.BoardVO;
import vo.ReplyVO;

@Component
public class BoardDao {
	@Autowired
	private SqlSessionTemplate session;

	// 페이징 처리
	public List<BoardVO> selectList(int startRow, int count) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectList(startRow, count);
	}

	public int selectCount() {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectTotalCount();
	}

	public int selectTitleCount(String title) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectTitleCount(title);
	}

	public int selectWriterCount(String writer) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectWriterCount(writer);
	}

	public int selectKategorieCount(String kategorie) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectKategorieCount(kategorie);
	}

	///////////////////////////////////////////////////
	// 검색 마다 변하는 select
	public List<BoardVO> selectTitle(int startRow, int count, String title) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectTitle(startRow, count, title);
	}

	public List<BoardVO> selectWriter(int startRow, int count, String writer) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectWriter(startRow, count, writer);
	}

	public List<BoardVO> selectKategorie(int startRow, int count, String kategorie) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectKategorie(startRow, count, kategorie);
	}
	///////////////////////////////////////////////////////

	public int insert(BoardVO board) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.insert(board);

	}

	public int update(BoardVO board) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.update(board);
	}

	public int updateRef(int boardNum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.updateRef(boardNum);
	}

	public BoardVO select(int boardNum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.select(boardNum);
	}

	public int checkSelect(BoardVO board) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.checkSelect(board);
	}

	public int maxStep(int ref) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.maxStep(ref);
	}

	public int insertReple(BoardVO board) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.insertReple(board);
	}

	public int updateStep(BoardVO board) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.updateStep(board);
	}

	public int delete(int ref) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.delete(ref);
	}

	public int deleteReple(int step, int minStep) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.deleteReple(step, minStep);
	}

	public int updateCount(int boardNum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.updateCount(boardNum);
	}

	// 회원탈퇴 전에 하는 작업
	public int deleteReplyLoginId(String loginId) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.deleteReplyLoginId(loginId);
	}

	public int deleteBoardLoginId(String loginId) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.deleteBoardLoginId(loginId);
	}

	// 여기부터 리플에 대한 작업
	public List<ReplyVO> selectReplyList(int boardNum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectReplyList(boardNum);
	}

	public ReplyVO selectReply(int replyNum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectReply(replyNum);
	}

	public int insertReply(ReplyVO reply) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.insertReply(reply);
	}

	public int deleteReply(int replyNum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.deleteReply(replyNum);
	}

	public int deleteAllReply(int ref) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.deleteAllReply(ref);
	}

	// GALLERY
	public List<BoardVO> selectGallery() {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectGallery();
	}

	// MAIN
	public List<BoardVO> selectMain() {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectMain();
	}
}
