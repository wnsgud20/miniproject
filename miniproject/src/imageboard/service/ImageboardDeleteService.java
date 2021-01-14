package imageboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.dao.ImageboardDAO;

public class ImageboardDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String[] seq = request.getParameterValues("check");
		
		//DB
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		imageboardDAO.imageboardDelete(seq);
		
//		for(int i = 0; i < seq.length ; i++) {
//			imageboardDAO.imageboardDelete(seq[i]);
//		}
		
		//응답
		request.setAttribute("display","/imageboard/imageboardDelete.jsp");
		return "/main/index.jsp";
	}

}












