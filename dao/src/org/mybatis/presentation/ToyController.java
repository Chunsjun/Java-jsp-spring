package org.mybatis.presentation;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.domain.Toy;
import org.mybatis.service.ToyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping(value = "/toy")
public class ToyController {
	@Resource
	private ToyService toyService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(Toy toy) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/toy/list");
		/* 서비스 객체 호출 */
		List<Toy> listToy = this.toyService.list(toy);
		modelAndView.addObject("listToy", listToy);

		return modelAndView;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addForm() throws Exception {
		return "/toy/add";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(Toy toy) throws Exception {
		RedirectView redirectView = new RedirectView("/toy/list");
		redirectView.setExposeModelAttributes(false);
		/* 서비스 객체 호출 */
		this.toyService.add(toy);

		return new ModelAndView(redirectView);
	}
	
	@RequestMapping(value = "/remove/{toyNo}", method = RequestMethod.GET)
	public ModelAndView remove(@PathVariable (value = "toyNo") int toyNo) throws Exception {
		RedirectView redirectView = new RedirectView("/toy/list");
		redirectView.setExposeModelAttributes(false);
		/* 서비스 객체 호출 */
		this.toyService.remove(toyNo);

		return new ModelAndView(redirectView);
	}
	
	@RequestMapping(value = "/edit/{toyNo}", method = RequestMethod.GET)
	public ModelAndView editForm(@PathVariable(value = "toyNo") int toyNo) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/toy/edit");
		
		modelAndView.addObject("toy", this.toyService.view(toyNo));
		
		return modelAndView;
	}

	@RequestMapping(value = "/edit/{toyNo}", method = RequestMethod.POST)
	public ModelAndView edit(Toy toy) throws Exception {
		RedirectView redirectView = new RedirectView("/toy/list");
		redirectView.setExposeModelAttributes(false);
		/* 서비스 객체 호출 */
		this.toyService.edit(toy);

		return new ModelAndView(redirectView);
	}
	
	@RequestMapping(value = "/view/{toyNo}", method = RequestMethod.GET)
	public ModelAndView view(@PathVariable (value = "toyNo") int toyNo) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/toy/view");
		/* 서비스 객체 호출 */
		modelAndView.addObject("toy", this.toyService.view(toyNo));
		
		return modelAndView;
	}
	
	
}
