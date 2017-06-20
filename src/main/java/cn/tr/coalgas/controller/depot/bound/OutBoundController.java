package cn.tr.coalgas.controller.depot.bound;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tr.coalgas.entity.OutBound;
import cn.tr.coalgas.service.depot.bound.IOutBoundService;

/**
 * 
 * 仓库出库控制器
 * 
 * @author taorun
 * @date 2017年4月30日 下午5:44:53
 * 
 */

@Controller
@RequestMapping("/outbound")
public class OutBoundController {
	
	@Resource
	private IOutBoundService outBoundService;
	
	@RequestMapping("/insert")
	public void insert(OutBound outBound, HttpServletResponse response) {
		outBoundService.insert(outBound, response);
	}
	
	@RequestMapping("/detail")
	public String detail(int id, HttpServletRequest request) {
		return outBoundService.selectById(id, request);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(int id) {
		outBoundService.deleteById(id);
	}
	
	@RequestMapping("/history")
	public String selectList(OutBound outBound, HttpServletRequest request) {
		return outBoundService.selectList(outBound, request);
	}

}
