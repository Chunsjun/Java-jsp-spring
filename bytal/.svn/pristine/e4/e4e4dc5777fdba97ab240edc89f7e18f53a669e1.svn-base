package org.bytal.presentation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/bytal")
public class WebBytalController {
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String bytalInfo() throws Exception {
		return "/web/bytal/bytalInfo";
	}
	@RequestMapping(value = "/developer", method = RequestMethod.GET)
	public String developer() throws Exception {
		return "/web/bytal/developer";
	}
}
