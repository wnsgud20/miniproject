package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	private static BoardDAO instance;
	private SqlSessionFactory sqlSessionFactory;

	public BoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static BoardDAO getInstance() {
		if (instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}

	public void boardWrite(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("boardSQL.boardWrite", map);
		sqlSession.commit();
		sqlSession.close();
	}

	public List<BoardDTO> boardList(int startNum, int endNum){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = sqlSession.selectList("boardSQL.boardList", map);
		sqlSession.close();
		return list;
	}
	
	public int getTotalA(){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getTotalA");
		sqlSession.close();
		return totalA;
	}
	
	public BoardDTO boardView(int seq){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.boardView", seq);
		sqlSession.close();
		return boardDTO;
	}	
	
	public void hitUpdate(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.hitUpdate", seq);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public void boardModify(Map<String, Object> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.boardModify", map);
		sqlSession.commit();
		sqlSession.close();		
	}
	
	public void boardReply(Map<String, String> map) {
		BoardDTO pDTO = boardView(Integer.parseInt(map.get("pseq")));//원글
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		//step update
		sqlSession.update("boardSQL.boardReply1", pDTO);
		
		//insert
		map.put("ref", pDTO.getRef()+"");//원글 ref(그룹번호)
		map.put("lev", pDTO.getLev()+1+""); //원글lev + 1
		map.put("step", pDTO.getStep()+1+"");//원글step + 1
		sqlSession.insert("boardSQL.boardReply2", map);
		
		//reply update
		sqlSession.update("boardSQL.boardReply3", pDTO.getSeq());
		sqlSession.commit();
		sqlSession.close();
	}
	
	public void boardDelete(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("boardSQL.boardDelete", seq);
		sqlSession.commit();
		sqlSession.close();		
	}

	public List<BoardDTO> boardSearch(Map<String, Object> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = sqlSession.selectList("boardSQL.boardSearch", map);
		sqlSession.close();
		return list;
	}

	public int getSearchTotalA(Map<String, Object> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getSearchTotalA", map);
		sqlSession.close();
		return totalA;
	}
}































