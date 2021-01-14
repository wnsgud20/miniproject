package board.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		//조회수 - 새로고침 방지
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				if (cookies[i].getName().equals("memHit")) {
					boardDAO.hitUpdate(seq); //조회수 증가
					cookies[i].setMaxAge(0); //쿠키 삭제
					response.addCookie(cookies[i]); //쿠키 삭제된걸 클라이언트에게 보내주기.
				}
			}//for
		}
				
		BoardDTO boardDTO = boardDAO.boardView(seq);
		
		request.setAttribute("pg", pg);
		request.setAttribute("boardDTO", boardDTO);
		request.setAttribute("display", "/board/boardView.jsp");
		return "/main/index.jsp";
	}

}










