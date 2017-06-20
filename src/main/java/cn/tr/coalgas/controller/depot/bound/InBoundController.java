package cn.tr.coalgas.controller.depot.bound;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tr.coalgas.entity.InBound;
import cn.tr.coalgas.service.depot.bound.IInBoundService;

/**
 * 
 * 仓库入库控制器
 * 
 * @author taorun
 * @date 2017年4月30日 下午5:44:53
 * 
 */

@Controller
@RequestMapping("/inbound")
public class InBoundController {
	
	@Resource
	private IInBoundService inBoundService;
	
	@RequestMapping("/detail")
	public String detail(int id, HttpServletRequest request) {
		return inBoundService.selectById(id, request);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(int id) {
		inBoundService.deleteById(id);
	}
	
	@RequestMapping("/insert")
	public void insert(InBound inBound, HttpServletResponse response) {
		inBoundService.insert(inBound, response);
	}
	
	@RequestMapping("/history")
	public String selectList(InBound inBound, HttpServletRequest request) {
		return inBoundService.selectList(inBound, request);
	}

}
