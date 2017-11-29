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
	
	public List<BoardVO> selectList(){
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectList();
	}
	
	public List<BoardVO> selectTitle(String title){
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectTitle(title);
	}
	
	public List<BoardVO> selectWriter(String writer){
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectWriter(writer);
	}
	
	public List<BoardVO> selectKategorie(String kategorie){
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectKategorie(kategorie);
	}
	
	
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
	
	public int deleteReple(int step,int minStep) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.deleteReple(step, minStep);
	}
	
	public int updateCount(int boardNum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.updateCount(boardNum);
	}
	
	
	
	//여기부터 리플에 대한 작업
	public List<ReplyVO> selectReplyList(int boardNum){
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
	
}
