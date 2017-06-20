package cn.tr.coalgas.controller.dry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tr.coalgas.entity.Dry;
import cn.tr.coalgas.service.dry.IDryService;

/**
 * 
 * 干燥控制器
 * 
 * @author taorun
 * @date 2017年4月24日 上午9:51:09
 * 
 */

@Controller
@RequestMapping("/dry")
public class DryController {
	
	@Resource
	private IDryService dryService;
	
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(int id) {
		dryService.deleteById(id);
	}
	
	@RequestMapping("/update")
	public void update(Dry dry, HttpServletResponse response) {
		dryService.update(dry, response);
	}
	
	@RequestMapping("/edit")
	public String edit(int id, HttpServletRequest request) {
		return dryService.edit(id, request);
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request) {
		return "dry/add";
	}
	
	@RequestMapping("/insert")
	public void insert(Dry dry, HttpServletResponse response) {
		dryService.insert(dry, response);
	}
	
	@RequestMapping("/list")
	public void list(Dry dry, HttpServletRequest request) {
		dryService.selectList(dry, request);
	}

}
