package org.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ApiController {
	/* 메인페이지 호출 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() throws Exception {
		return "/main";
	}
}
