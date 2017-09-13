package org.myboard.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.myboard.domain.BoardVO;
import org.myboard.domain.FileVO;
import org.myboard.domain.PageInfo;
import org.myboard.domain.ReviewVO;
import org.myboard.domain.UserVO;
import org.myboard.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class BoardController {

	@Resource
	private BoardService service;

	@RequestMapping(value = "/list")
	public ModelAndView list(BoardVO vo, HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("/board/list");
		PageInfo info = new PageInfo(request, service.cnt(vo));
		
		vo.setStartNum(info.getListStartNum());
		vo.setListSize(info.getListsize());
		
		List<BoardVO> list = service.list(vo);
		
		mv.addObject("navigator", info.getNavigator());
		mv.addObject("board", list);
		mv.addObject("search",vo);
		return mv;
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeP(UserVO vo,HttpSession session) {
		vo = (UserVO)session.getAttribute("user");
		if(vo != null){
			return "/board/write";
		}else{
			return "/user/login";
		}
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public ModelAndView writeW(BoardVO bvo, FileVO fvo, HttpSession session, HttpServletRequest request)throws IOException{
		RedirectView redirectView = new RedirectView("/list");
		redirectView.setExposeModelAttributes(false);
		
		int sizeLimit = 1024*1024*10; //10mbyte
		String savePath = request.getServletContext().getRealPath("resources/files"); // 이클립스 개발용
		//String savePath = "/home/hosting_users/chunsjun/tomcat/webapps/ROOT/resources/files"; // cafe24 전용
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

		UserVO uvo = (UserVO) session.getAttribute("user");
		bvo.setWriter(uvo.getName());
		bvo.setUno(uvo.getUno());
		bvo.setTitle(multi.getParameter("title"));
		bvo.setContent(multi.getParameter("content"));
		service.write(bvo);
		
		String fileName = multi.getFilesystemName("file");
		if(fileName != null){
			fvo.setFile_title(fileName);
			fvo.setFile_path(savePath+"/"+fileName);
			service.fileUpload(fvo);
		}
		
		return new ModelAndView(redirectView);
	}

	@RequestMapping(value = "/view/{bno}", method = RequestMethod.GET)
	public ModelAndView view(@PathVariable("bno") int bno, FileVO fvo) {
		ModelAndView mv = new ModelAndView("/board/view");
		
		BoardVO vo = service.view(bno);
		if(vo == null){
			ModelAndView mav = new ModelAndView("/index");
			StringBuffer sb = new StringBuffer();
			sb.append("alert('잘못된 접근입니다.')");
			mav.addObject("alert", sb);
			return mav;
		}
		
		List<ReviewVO> rList = service.rList(bno);
		List<ReviewVO> cList = service.cList(bno);
		for(int i = 0; i < rList.size(); i ++){
			List<ReviewVO> temp = new ArrayList<>();
			for(int j = 0; j < cList.size(); j++){
				if(rList.get(i).getRno() == cList.get(j).getParent()){
					temp.add(cList.get(j));
				}
			}
			rList.get(i).setComment(temp);
		}
		
		String str = vo.getContent();
		str = str.replace("\r\n", "<br>");
		vo.setContent(str);
		
		fvo = service.fileLoad(fvo);
		if(fvo != null){
			str = fvo.getFile_path();
			str = str.replace("C:\\WorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\myboard\\", "/").replace("\\", "/"); // 이클립스 개발용
			//str = str.replace("/home/hosting_users/chunsjun/tomcat/webapps/ROOT/", "/"); // cafe24 전용
			fvo.setFile_path(str);
			mv.addObject("file", fvo);
		}

		mv.addObject("view", vo);
		mv.addObject("rList",rList);
		return mv;
	}

	@RequestMapping(value = "/delete/{boardNo}")
	public ModelAndView deleteW(@PathVariable("boardNo")int bno, HttpSession session) {
		RedirectView redirectView = new RedirectView("/list");
		redirectView.setExposeModelAttributes(false);
		
		UserVO uvo = (UserVO)session.getAttribute("user");
		BoardVO bvo = service.view(bno);
		
		if(uvo != null && uvo.getUno() == bvo.getUno()){
			service.delete(bvo);
			return new ModelAndView(redirectView);
		}else{
			ModelAndView mv = new ModelAndView("/index");
			StringBuffer sb = new StringBuffer();
			sb.append("alert('잘못된 접근입니다.')");
			mv.addObject("alert", sb);
			return mv;
		}
	}
	
	@RequestMapping(value = "/update/{boardNo}", method = RequestMethod.GET)
	public ModelAndView updateP(@PathVariable("boardNo")int bno, HttpSession session, UserVO uvo){
		uvo = (UserVO) session.getAttribute("user");
		BoardVO bvo = service.view(bno);
		
		if(uvo.getUno() != bvo.getUno() || bvo == null){
			ModelAndView mv = new ModelAndView("/index");
			StringBuffer sb = new StringBuffer();
			sb.append("alert('잘못된 접근입니다.')");
			mv.addObject("alert", sb);
			return mv;
		}else{
			ModelAndView mv = new ModelAndView("/board/update");
			mv.addObject("view",bvo);
			return mv;
		}
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updateW(BoardVO vo, HttpSession session){
		RedirectView redirectView = new RedirectView("/view/"+vo.getBno());
		redirectView.setExposeModelAttributes(false);
		
		service.update(vo);
		
		return new ModelAndView(redirectView);
	}
	
	@RequestMapping(value = "/reviewW")
	public ModelAndView reviewW(ReviewVO rvo, UserVO uvo, HttpSession session){
		RedirectView redirectView = new RedirectView("/view/"+rvo.getBno());
		redirectView.setExposeModelAttributes(false);
		
		uvo = (UserVO) session.getAttribute("user");
		
		if(uvo != null){
			rvo.setUno(uvo.getUno());
			service.rWrite(rvo);
			return new ModelAndView(redirectView);
		}else{
			ModelAndView mv = new ModelAndView("/index");
			StringBuffer sb = new StringBuffer();
			sb.append("alert('잘못된 접근입니다.')");
			mv.addObject("alert", sb);
			return mv;
		}
	}
	
	@RequestMapping(value = "/commentW")
	public ModelAndView commentW(ReviewVO rvo, UserVO uvo, HttpSession session){
		RedirectView redirectView = new RedirectView("/view/"+rvo.getBno());
		redirectView.setExposeModelAttributes(false);
		
		uvo = (UserVO) session.getAttribute("user");
		rvo.setParent(rvo.getRno());
		
		if(uvo != null){
			rvo.setUno(uvo.getUno());
			service.cWrite(rvo);
			return new ModelAndView(redirectView);
		}else{
			ModelAndView mv = new ModelAndView("/index");
			StringBuffer sb = new StringBuffer();
			sb.append("alert('잘못된 접근입니다.')");
			mv.addObject("alert", sb);
			return mv;
		}
	}
	
	@RequestMapping(value = "/reviewD/{bno}/{rno}")
	public ModelAndView reviewD(@PathVariable int bno, @PathVariable int rno, UserVO uvo, HttpSession session){
		RedirectView redirectView = new RedirectView("/view/"+bno);
		redirectView.setExposeModelAttributes(false);
		
		uvo = (UserVO) session.getAttribute("user");
		
		if(uvo != null){
			service.rcDelete(rno);
			return new ModelAndView(redirectView);
		}else{
			ModelAndView mv = new ModelAndView("/index");
			StringBuffer sb = new StringBuffer();
			sb.append("alert('잘못된 접근입니다.')");
			mv.addObject("alert", sb);
			return mv;
		}
	}
	
}
