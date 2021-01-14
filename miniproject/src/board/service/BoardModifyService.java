package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardModifyService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq", seq);
	    map.put("subject", subject);
	    map.put("content", content);
	      
		//DB
	    BoardDAO boardDAO = BoardDAO.getInstance();
	    boardDAO.boardModify(map);
	    
		//응답
	    request.setAttribute("pg", pg);
	    request.setAttribute("display", "/board/boardModify.jsp");
	    return "/main/index.jsp";
	}

}











