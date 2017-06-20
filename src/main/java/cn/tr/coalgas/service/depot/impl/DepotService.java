package cn.tr.coalgas.service.depot.impl;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import cn.tr.coalgas.dao.depot.IDepotDao;
import cn.tr.coalgas.entity.Depot;
import cn.tr.coalgas.service.depot.IDepotService;

/**
 * 
 * 仓库业务层实现
 * 
 * @author taorun
 * @date 2017年4月13日 下午6:29:14
 * 
 */

@Service
public class DepotService implements IDepotService {
	
	@Resource
	private IDepotDao depotDao;
	
	public void insert(Depot record, HttpServletResponse response) {
		depotDao.insert(record);
		try {
			response.setCharacterEncoding("GBK");
			response.getWriter().print("<script>alert('新增成功');location.href='/coal-gas-system/depot/list?page=1';</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void updateById(Depot record, HttpServletResponse response) {
		depotDao.updateById(record);
		try {
			response.setCharacterEncoding("GBK");
			response.getWriter().print("<script>alert('更新成功');location.href='/coal-gas-system/depot/list?page=1';</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String selectList(Depot depot, HttpServletRequest request) {
		List<Depot> depot_list = depotDao.selectList(depot);
		request.setAttribute("depot_list", depot_list);
		return "depot/list";
	}

	public String selectById(Integer id, HttpServletRequest request) {
		request.setAttribute("depot", depotDao.selectById(id));
		return "depot/edit";
	}
	
	public String detail(Integer id, HttpServletRequest request) {
		request.setAttribute("depot", depotDao.selectById(id));
		return "depot/detail";
	}

	public void deleteById(Integer id) {
		depotDao.deleteById(id);
	}
	
	public String checkIdExist(int id) {
		if (depotDao.selectById(id) != null)
			return "* 该仓库号已存在";
		else
			return "";
	}
	
	public String checkIdUnExist(int id) {
		if (depotDao.selectById(id) == null)
			return "* 该仓库号不存在";
		else
			return "";
	}

}
