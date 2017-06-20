package cn.tr.coalgas.service.staff;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.tr.coalgas.entity.Staff;

/**
 * 
 * 员工业务层接口
 * 
 * @author taorun
 * @date 2017年4月5日 上午9:01:04
 * 
 */

public interface IStaffService {
	
	void login(Staff staff, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, ServletException;
	
	void insert(Staff staff, HttpServletResponse response) throws ServletException, IOException;
	
	String selectList(HttpServletRequest request);

	void deleteById(Integer id, HttpServletResponse response) throws IOException;

    void updateById(Staff staff, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, ServletException;

	void updatePasswordById(Staff staff, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException;

	void seniorUpdate(Staff staff, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException;

	String manage(int id, HttpServletRequest request);

	void checkEmailExist(String email, HttpServletResponse response, HttpSession session) throws IOException;

	void checkPhoneExist(String phone, HttpServletResponse response, HttpSession session) throws IOException;

}



