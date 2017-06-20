package cn.tr.coalgas.controller.staff;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tr.coalgas.entity.Staff;
import cn.tr.coalgas.service.staff.IStaffService;

/**
 * 
 * 员工控制器
 * 
 * @author taorun
 * @date 2017年4月5日 下午2:41:44
 * 
 */

@Controller
@RequestMapping("/staff")
public class StaffController {
	
	@Resource
	private IStaffService staffService;
	
	@RequestMapping("/login")
	@ResponseBody
	public void login(Staff staff, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, ServletException {
		staffService.login(staff, request, response, session);
	}
	
	@RequestMapping("/insert")
	public void insert(Staff staff, HttpServletResponse response) throws ServletException, IOException {
		staffService.insert(staff, response);
	}
	
	@RequestMapping("/information")
	public String toInformation() {
		return "staff/information";
	}
	
	@RequestMapping("/register")
	public String register() {
		return "staff/register";
	}
	
	@RequestMapping("/security")
	public String toUpdatePassword() {
		return "staff/updatePassword";
	}
	
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public void update(Staff staff, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, ServletException {
		staffService.updateById(staff, request, response, session);
	}
	
	@RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
	public void updatePassword(Staff staff, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		staffService.updatePasswordById(staff, request, response, session);
	}
	
	@RequestMapping(value = "/seniorUpdate", method = RequestMethod.POST)
	public void seniorUpdate(Staff staff, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		staffService.seniorUpdate(staff, request, response, session);
	}

	@RequestMapping("/list")
	public String staffList(HttpServletRequest request) {
		return staffService.selectList(request);
	}
	
	@RequestMapping("/manage")
	public String manage(int id, HttpServletRequest request) {
		return staffService.manage(id, request);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(int id, HttpServletResponse response) throws IOException {
		staffService.deleteById(id, response);
	}
	
	@RequestMapping("/checkEmailExist")
	public void checkEmailExist(String email, HttpServletResponse response, HttpSession session) throws IOException {
		staffService.checkEmailExist(email, response, session);
	}
	
	@RequestMapping("/checkPhoneExist")
	public void checkPhoneExist(String phone, HttpServletResponse response, HttpSession session) throws IOException {
		staffService.checkPhoneExist(phone, response, session);
	}
	
}
