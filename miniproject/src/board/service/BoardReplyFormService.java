package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class BoardReplyFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int pseq = Integer.parseInt(request.getParameter("pseq"));//원글번호
		int pg = Integer.parseInt(request.getParameter("pg"));//원글이 있는 페이지 번호
		
		//응답
		request.setAttribute("pseq", pseq);
		request.setAttribute("pg", pg);
		request.setAttribute("display", "/board/boardReplyForm.jsp");
		return "/main/index.jsp";
	}

}
