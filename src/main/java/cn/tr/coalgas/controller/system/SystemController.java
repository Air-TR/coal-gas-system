package cn.tr.coalgas.controller.system;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * 系统控制器
 * 
 * @author taorun
 * @date 2017年4月6日 上午11:46:06
 * 
 */

@Controller
public class SystemController {
	
	@RequestMapping("/map")
	public String map() {
		return "map/map";
	}
	
	@RequestMapping("/map2")
	public String map3() {
		return "map/map2";
	}
	
	@RequestMapping("/home")
	public String toHome() {
		return "home";
	}
	
	@RequestMapping("/logout")
	public void toLogout (HttpServletResponse response, HttpSession session) {
		session.removeAttribute("user");
		try {
			response.sendRedirect("/coal-gas-system/");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/table")
	public String toTable() {
		return "table";
	}
	
	@RequestMapping("/form")
	public String toForm() {
		return "form";
	}
	
	@RequestMapping("/help")
	public String toHelp() {
		return "help";
	}
	
	@RequestMapping("/gallery")
	public String toGallery() {
		return "gallery";
	}
	
	@RequestMapping("/log")
	public String toLog() {
		return "log";
	}
	
	@RequestMapping("/404")
	public String to404() {
		return "404";
	}
	
	@RequestMapping("/error_role")
	public String toErrorRole() {
		return "error_role";
	}

}
