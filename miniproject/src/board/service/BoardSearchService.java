package board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardSearchService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		
		//1페이지당 5개씩
		int endNum = pg*5;
		int startNum = endNum-4;
		
		//DB
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		List<BoardDTO> list = boardDAO.boardSearch(map);
		
		//페이징 처리
		int totalA = boardDAO.getSearchTotalA(map); //검색한 총글수
		
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		
		boardPaging.makePagingHTML();		
		
		//응답
		request.setAttribute("pg", pg);
		request.setAttribute("list", list);
		request.setAttribute("boardPaging", boardPaging);
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("display", "/board/boardList.jsp");
		return "/main/index.jsp";
	}

}











