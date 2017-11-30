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

	
	//����¡ ó���� ���� �۾�
	public List<BoardVO> selectList(@Param("startRow")int startRow, @Param("count")int count);
	public int selectTotalCount();
	public int selectTitleCount(String title);
	public int selectWriterCount(String writer);
	public int selectKategorieCount(String kategorie);
	
	//�˻� â�� �Է½� �ݿ��Ǵ� select��
	//(1)����
	public List<BoardVO> selectTitle(@Param("startRow")int startRow, @Param("count")int count,@Param("title")String title);
	//(2)�ۼ���
	public List<BoardVO> selectWriter(@Param("startRow")int startRow, @Param("count")int count,@Param("writer")String writer);
	//(3)ī�װ�
	public List<BoardVO> selectKategorie(@Param("startRow")int startRow, @Param("count")int count,@Param("kategorie")String kategorie);
	

	//����� ���� SQL�� 
	//(1)��� / ��� ���� Ȯ���ϱ� 
	public int checkSelect(BoardVO board);
	//(2)null���϶� max(step)���� �����ش�
	public int maxStep(int ref);
	//(3)����� �ۼ��Ѵ�
	public int insertReple(BoardVO board);
	//(4)null���� �ƴҶ� ������ step���� ������Ų��
	public int updateStep(BoardVO board);
	//(5)��/������ ��������� delete
	public int deleteReple(@Param("step")int step, @Param("minStep")int minStep);
	
	
	//������ ���� SQL
	public List<ReplyVO> selectReplyList(int boardNum);
	public ReplyVO selectReply(int replyNum);
	public int insertReply(ReplyVO reply);
	public int deleteReply(int replyNum);
	public int deleteAllReply(int ref);
	public int write(HashMap hm);
	//���� ���ε�
	
	
	
}
