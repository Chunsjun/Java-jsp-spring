package org.bytal.presentation;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.bytal.domain.Cradle;
import org.bytal.domain.PageInformation;
import org.bytal.service.webService.WebService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping(value = "/bytal")
public class WebCradleController {
	@Resource
	private WebService webService;
	
	/* 대여소 지도 API */
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public ModelAndView map(Cradle cradle) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/web/cradle/map");
		
		List<Cradle> listMap = this.webService.list(cradle);
		modelAndView.addObject("listMap", listMap);
		
		return modelAndView;
	}
	
	/* 대여소 등록 */
	@RequestMapping(value = "/cradleAdd", method = RequestMethod.POST)
	public ModelAndView cradleAdd(Cradle cradle, HttpServletRequest request) throws Exception {
		RedirectView redirectView = new RedirectView("/bytal/map");
		redirectView.setExposeModelAttributes(false);
		
		ModelAndView modelAndView = new ModelAndView(redirectView);
		
		cradle.setxCoordinate(request.getParameter("x"));
		cradle.setyCoordinate(request.getParameter("y"));
		cradle.setCradleName(request.getParameter("cradleName"));
		cradle.setCradleStatus(request.getParameter("cradleStatus"));
		this.webService.add(cradle);
		
		List<Cradle> listMap = this.webService.list(cradle);
		modelAndView.addObject("listMap", listMap);
		
		return modelAndView;
	}
	/* 대여소 등록 폼 */
	@RequestMapping(value = "/cradleAdd", method = RequestMethod.GET)
	public String cradleAddForm() throws Exception{
		return "/web/cradle/cradleAdd";
	}
	
	/* 대여소 목록  */
	@RequestMapping(value = "/listMap{status}")
	public ModelAndView listMap(HttpServletRequest request, Cradle cradle,
			@PathVariable (value = "status") String status) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/web/cradle/listMap");
		
		int count = webService.count(cradle);
		
		PageInformation page = new PageInformation(request, count);
		modelAndView.addObject("pageNo", page.getPageNo());
		modelAndView.addObject("pageItemCount", page.getPageItemCount());
		modelAndView.addObject("navigator", page.getNavigator());
		
		cradle.setItemStartNo(page.getItemStartNo());
		cradle.setItemEndNo(page.getItemEndNo());
		cradle.setCradleStatus(status);
		
		List<Cradle> listMap = this.webService.list(cradle);
		modelAndView.addObject("listMap", listMap);

		return modelAndView;
	}
	
	/* 대여소 삭제  */
	@RequestMapping(value = "/cradleDelete/{cradleNo}", method = RequestMethod.GET)
	public ModelAndView cradleDelete(@PathVariable (value = "cradleNo") int cradleNo) 
			throws Exception {
		RedirectView redirectView = new RedirectView("/bytal/listMap");
		redirectView.setExposeModelAttributes(false);
		
		webService.delete(cradleNo);
			
		return new ModelAndView(redirectView);
	}
	
	/* 대여소 수정폼 */
	@RequestMapping(value = "/cradleEdit/{cradleNo}", method = RequestMethod.GET)
	public ModelAndView cradleEditForm(@PathVariable (value = "cradleNo") int cradleNo) 
			throws Exception {
		ModelAndView modelAndView = new ModelAndView("/web/cradle/cradleEdit");
		modelAndView.addObject("editInfo", this.webService.view(cradleNo));
		
		return modelAndView;
	}
	/* 대여소 수정  */
	@RequestMapping(value = "/cradleEdit/{cradleNo}", method = RequestMethod.POST)
	public ModelAndView edit(Cradle cradle) throws Exception {
		RedirectView redirectView = new RedirectView("/bytal/listMap");
		redirectView.setExposeModelAttributes(false);
		
		this.webService.edit(cradle);

		return new ModelAndView(redirectView);
	}
}
