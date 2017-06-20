package cn.tr.coalgas.service.dry.impl;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import cn.tr.coalgas.dao.dry.IDryDao;
import cn.tr.coalgas.entity.Dry;
import cn.tr.coalgas.service.dry.IDryService;

/**
 * 
 * 
 * 
 * @author taorun
 * @date 2017年4月24日 上午9:48:32
 * 
 */

@Service
public class DryService implements IDryService {
	
	@Resource
	private IDryDao dryDao;

	public void selectList(Dry dry, HttpServletRequest request) {
		List<Dry> dry_list = dryDao.selectList(dry);
		request.setAttribute("dry_list", dry_list);
	}

	public void insert(Dry dry, HttpServletResponse response) {
		dryDao.insert(dry);
		try {
			response.setCharacterEncoding("GBK");
			response.getWriter().print("<script>alert('新增成功');location.href='/coal-gas-system/dry/list?page=1';</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String edit(int id, HttpServletRequest request) {
		request.setAttribute("dry", dryDao.selectById(id));
		return "dry/edit";
	}

	public void update(Dry dry, HttpServletResponse response) {
		dryDao.updateById(dry);
		try {
			response.setCharacterEncoding("GBK");
			response.getWriter().print("<script>alert('修改成功');location.href='/coal-gas-system/dry/list?page=1';</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void deleteById(int id) {
		dryDao.deleteById(id);
	}

}
