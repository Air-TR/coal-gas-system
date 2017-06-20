package cn.tr.coalgas.controller.depot;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tr.coalgas.entity.Depot;
import cn.tr.coalgas.service.depot.IDepotService;

/**
 * 
 * 仓库控制器
 * 
 * @author taorun
 * @date 2017年4月13日 下午6:31:55
 * 
 */

@Controller
@RequestMapping("/depot")
public class DepotController {
	
	@Resource
	private IDepotService depotService;
	
	@RequestMapping("/list")
	public String list(Depot depot, HttpServletRequest request) {
		return depotService.selectList(depot, request);
	}
	
	@RequestMapping("/add")
	public String add() {
		return "depot/add";
	}
	
	@RequestMapping("/insert")
	public void insert(Depot depot, HttpServletResponse response) {
		depotService.insert(depot, response);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(int id) {
		depotService.deleteById(id);
	}
	
	@RequestMapping("/edit")
	public String edit(int id, HttpServletRequest request) {
		return depotService.selectById(id, request);
	}
	
	@RequestMapping("/detail")
	public String detail(int id, HttpServletRequest request) {
		return depotService.detail(id, request);
	}
	
	@RequestMapping("/update")
	public void update(Depot depot, HttpServletResponse response) {
		depotService.updateById(depot, response);
	}

	@RequestMapping("/inbound")
	public String inbound() {
		return "depot/inbound/add";
	}
	
	@RequestMapping("/outbound")
	public String outbound() {
		return "depot/outbound/add";
	}
	
	@RequestMapping("/checkIdExist")
	@ResponseBody
	public String checkIdExist(int id) {
		return depotService.checkIdExist(id);
	}
	
	@RequestMapping("/checkIdUnExist")
	@ResponseBody
	public String checkIdUnExist(int id) {
		return depotService.checkIdUnExist(id);
	}

}
