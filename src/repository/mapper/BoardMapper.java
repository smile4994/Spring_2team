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
	
	
	//�˻� â�� �Է½� �ݿ��Ǵ� select��
	//(1)����
	public List<BoardVO> selectTitle(String title);
	//(2)�ۼ���
	public List<BoardVO> selectWriter(String writer);
	//(3)ī�װ�
	public List<BoardVO> selectKategorie(String kategorie);
	
	
	
	
	
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
}
