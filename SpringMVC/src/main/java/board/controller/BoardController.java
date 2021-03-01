package board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.service.BoardService;

@Controller
@RequestMapping(value="board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="boardWriteForm", method=RequestMethod.GET)
	public String boardWriteForm(Model model) {
		model.addAttribute("display", "/board/boardWriteForm.jsp");
		return "/index";
	}
	
	@RequestMapping(value="boardWrite", method=RequestMethod.POST)
	@ResponseBody
	public void boardWrite(@RequestParam Map<String, String> map) {
		boardService.boardWrite(map);
	}
	
	@RequestMapping(value="boardList", method=RequestMethod.GET)
	public String boardList(@RequestParam(required=false, defaultValue="1") String pg, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/board/boardList.jsp");
		return "/index";
	}
	
	@RequestMapping(value="getBoardList", method=RequestMethod.POST)
	public ModelAndView getBoardList(@RequestParam(required=false, defaultValue="1") String pg,
									 HttpSession session,
									 HttpServletResponse response) {
		
		List<BoardDTO> list = boardService.getBoardList(pg);

		String memId = (String)session.getAttribute("memId");
		
		//조회수 - 새로고침 방지
		if(session.getAttribute("memId") != null) {
    		Cookie cookie = new Cookie("memHit", "0");//생성
    		cookie.setMaxAge(30*60);//초 단위 생존기간
    		cookie.setPath("/"); //모든 경로에서 접근 가능 하도록 설정
    		response.addCookie(cookie);//클라이언트에게 보내기
    	}
		
		//페이징처리
		BoardPaging boardPaging = boardService.boardPaging(pg);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("memId", memId);
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");
		return mav;		
	}
	
	@RequestMapping(value="getBoardSearch", method=RequestMethod.POST)
	public ModelAndView getBoardSearch(@RequestParam Map<String,String> map) {
		List<BoardDTO> list = boardService.getBoardSearch(map); //pg, searchType, keyword
		
		//페이징 처리
		BoardPaging boardPaging = boardService.boardPaging(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", map.get("pg"));
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	
	
	
	
	@RequestMapping(value="boardView", method=RequestMethod.GET)
	public String boardView(@RequestParam String seq,
							@RequestParam(required=false, defaultValue="1") String pg,
							Model model) {
		model.addAttribute("seq", seq);
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/board/boardView.jsp");
		return "/index";
	}
	
	@RequestMapping(value="getBoard", method=RequestMethod.POST)
	public ModelAndView getBoard(@RequestParam String seq,
								 @CookieValue(value="memHit", required=false) Cookie cookie,
								 HttpServletResponse response,
								 HttpSession session) {
		//조회수 - 새로고침 방지
		if(cookie != null) {
			boardService.hitUpdate(seq); //조회수 증가
			cookie.setMaxAge(0); //쿠키 삭제
			cookie.setPath("/"); //모든 경로에서 삭제 되었음을 알림
			response.addCookie(cookie); //쿠키 삭제된걸 클라이언트에게 보내주기.
		}

		BoardDTO boardDTO = boardService.getBoard(seq);
		
		String memId = (String)session.getAttribute("memId");

		ModelAndView mav = new ModelAndView();
		mav.addObject("boardDTO", boardDTO);
		mav.addObject("memId", memId);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="boardModifyForm", method=RequestMethod.POST)
	public String boardModifyForm(@RequestParam String seq,
								  @RequestParam String pg,
								  Model model) {
		model.addAttribute("seq", seq);
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/board/boardModifyForm.jsp");
		return "/index";
	}
	
	@RequestMapping(value="boardModify", method=RequestMethod.POST)
	@ResponseBody
	public void boardModify(@RequestParam Map<String, String> map) {
		boardService.boardModify(map);		
	}
	
	@RequestMapping(value="boardDeleteForm", method=RequestMethod.POST)
	public String boardDeleteForm(@RequestParam String seq, Model model) {
		//boardService.boardDelete(seq);
		
		model.addAttribute("seq", seq);
		model.addAttribute("display", "/board/boardDelete.jsp");
		return "/index";
	}
	
	@RequestMapping(value="boardDelete", method=RequestMethod.POST)
	@ResponseBody
	public void boardDelete(@RequestParam String seq, Model model) {
		boardService.boardDelete(seq);
	}
	
	@RequestMapping(value="boardReplyForm", method=RequestMethod.POST)
	public String boardReplyForm(@RequestParam String seq,
								 @RequestParam String pg,
								 Model model) {
		
		model.addAttribute("pseq", seq); //원글번호
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/board/boardReplyForm.jsp");
		return "/index";
	}
	
	@RequestMapping(value="boardReply", method=RequestMethod.POST)
	@ResponseBody
	public void boardReply(@RequestParam Map<String, String> map) {
		boardService.boardReply(map);
	}
}












