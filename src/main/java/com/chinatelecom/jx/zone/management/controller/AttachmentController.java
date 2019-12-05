package com.chinatelecom.jx.zone.management.controller;

 
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
public class AttachmentController {
	@RequestMapping(value = "/login/page/attachment/ClientManagement")
	public String ClientManagement(
			ModelMap model) {
		 return "/login/page/attachment/ClientManagement";
	}
}
