package cn.tr.coalgas.controller.transport;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tr.coalgas.entity.Transport;
import cn.tr.coalgas.service.transport.ITransportService;

/**
 * 
 * 输送控制器
 * 
 * @author taorun
 * @date 2017年5月18日 下午5:04:16
 * 
 */

@Controller
@RequestMapping("/transport")
public class TransportController {
	
	@Resource
	private ITransportService transportService;
	
	@RequestMapping("/list")
	public void list(Transport transport, HttpServletRequest request) {
		transportService.selectList(transport, request);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(int id) {
		transportService.delete(id);
	}
	
	@RequestMapping("/edit")
	public String edit(int id, HttpServletRequest request) {
		return transportService.selectById(id, request);
	}
	
	@RequestMapping("/update")
	public void update(Transport transport, HttpServletResponse response) {
		transportService.updateById(transport, response);
	}
	
	@RequestMapping("/insert")
	public void insert(Transport transport, HttpServletResponse response) {
		transportService.insert(transport, response);
	}
	
	@RequestMapping("/add")
	public String add() {
		return "transport/add";
	}

}
