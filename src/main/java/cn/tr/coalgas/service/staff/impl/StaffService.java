package cn.tr.coalgas.service.staff.impl;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import cn.tr.coalgas.dao.staff.IStaffDao;
import cn.tr.coalgas.entity.Staff;
import cn.tr.coalgas.service.staff.IStaffService;

/**
 * 
 * 员工业务层实现
 * 
 * @author taorun
 * @date 2017年4月5日 下午2:38:21
 * 
 */

@Service
public class StaffService implements IStaffService {
	
	@Resource
	private IStaffDao staffDao;
	
	public void login(Staff staff, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, ServletException {
		Staff user = staffDao.selectByEmailOrPhone(staff);
		if (user != null && user.getPassword().equals(staff.getPassword())) {
			// 登录成功
			session.setAttribute("user", user);
			session.setAttribute("address", "苏州科技大学石湖校区");
		} else {
			// 邮箱或密码不正确
			response.getWriter().println("登录名或密码不正确");
		}
	}

	public void deleteById(Integer id, HttpServletResponse response) throws IOException {
		staffDao.deleteById(id);
		response.sendRedirect("/coal-gas-system/staff/list");
	}

	public void insert(Staff staff, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("GBK");
		staffDao.insert(staff);
		response.getWriter().print("<script>alert('注册成功');location.href='/coal-gas-system/';</script>");
	}

	public void updateById(Staff staff, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, ServletException {
		response.setCharacterEncoding("GBK");
		Staff staff2 = staffDao.selectById(staff.getId());
		// 判断是否有更新
		if ((staff2.getNickname() == null ? staff.getNickname().equals("") : staff2.getNickname().equals(staff.getNickname())) &&
				(staff2.getName() == null ? staff.getName().equals("") : staff2.getName().equals(staff.getName())) &&
				(staff2.getAge() == null ? staff.getAge() == null : staff2.getAge() == staff.getAge()) &&
				staff2.getEmail().equals(staff.getEmail()) &&
				staff2.getPhone().equals(staff.getPhone()) &&
				(staff2.getIntroduction() == null ? staff.getIntroduction().equals("") : staff2.getIntroduction().equals(staff.getIntroduction()))) {
			response.getWriter().print("<script>alert('没有更新');location.href='/coal-gas-system/staff/information';</script>");
			return;
		}
		/**
		 * 其余所有合法性验证于js中进行
		 */
		// 修改个人资料成功
		staffDao.updateById(staff);
		session.setAttribute("user", staffDao.selectById(staff.getId()));
		response.getWriter().print("<script>alert('修改个人资料成功');location.href='/coal-gas-system/depot/list?page=1';</script>");
	}

	public void updatePasswordById(Staff staff, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException {
		response.setCharacterEncoding("GBK");
		staffDao.updatePasswordById(staff);
		session.setAttribute("staff", staffDao.selectById(staff.getId()));
		response.getWriter().print("<script>alert('修改密码成功');location.href='/coal-gas-system/depot/list?page=1';</script>");
	}

	public String selectList(HttpServletRequest request) {
		List<Staff> staff_list = staffDao.selectList();
		request.setAttribute("staff_list", staff_list);
		return "staff/list";
	}

	public void seniorUpdate(Staff staff, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		response.setCharacterEncoding("GBK");
		// 判断是否有更新
		Staff staff2 = staffDao.selectById(staff.getId());
		
		/**
		 * 邮箱手机格式及是否为空在staff/register.updqate.js中判断
		 */
		// 修改不成功，邮箱已被注册
		staff2 = staffDao.selectByEmail(staff.getEmail());
		if (staff2 != null && staff2.getId() != staff.getId()) {
			request.setAttribute("Error_UpdateStaff", "该邮箱已被注册");
			request.getRequestDispatcher("/staff/manage").forward(request, response);
			return;
		}
		
		// 修改不成功，手机号已被注册
		staff2 = staffDao.selectByPhone(staff.getPhone());
		if (staff2 != null && staff2.getId() != staff.getId()) {
			request.setAttribute("Error_UpdateStaff", "该手机号已被注册");
			request.getRequestDispatcher("/staff/manage").forward(request, response);
			return;
		}
		
		// 修改个人资料成功
		staffDao.updateById(staff);
		response.getWriter().print("<script>alert('修改成功');location.href='/coal-gas-system/staff/list';</script>");
	}

	public String manage(int id, HttpServletRequest request) {
		request.setAttribute("staff", staffDao.selectById(id));
		return "staff/manage";
	}

	public void checkEmailExist(String email, HttpServletResponse response, HttpSession session) throws IOException {
		if (staffDao.selectByEmail(email) != null) {
			if (session.getAttribute("user") != null) {
				if (((Staff) session.getAttribute("user")).getEmail().equals(email)){
					return;
				} else {
					response.getWriter().println("该邮箱已被注册");
				}
			} else {
				response.getWriter().println("该邮箱已被注册");
			}
		}
	}

	public void checkPhoneExist(String phone, HttpServletResponse response, HttpSession session) throws IOException {
		if (staffDao.selectByPhone(phone) != null) {
			if (session.getAttribute("user") != null) {
				if (((Staff) session.getAttribute("user")).getPhone().equals(phone)){
					return;
				} else {
					response.getWriter().println("该手机号已被注册");
				}
			} else {
				response.getWriter().println("该手机号已被注册");
			}
		}
	}

}
