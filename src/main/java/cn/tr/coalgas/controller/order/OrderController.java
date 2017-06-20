package cn.tr.coalgas.controller.order;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tr.coalgas.entity.Order;
import cn.tr.coalgas.service.order.IOrderService;

/**
 * 
 * 订单控制器
 * 
 * @author taorun
 * @date 2017年4月24日 下午4:52:11
 * 
 */

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Resource
	private IOrderService orderService;
	
	@RequestMapping("/add")
	public String add() {
		return "order/add";
	}
	
	@RequestMapping("/finish")
	@ResponseBody
	public void finish(Order order) {
		orderService.finish(order);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(Integer id) {
		orderService.delete(id);
	}
	
	@RequestMapping("/insert")
	public void insert(Order order, HttpServletResponse response) {
		orderService.insert(order, response);
	}
	
	@RequestMapping("/update")
	public void update(Order order, HttpServletResponse response) {
		orderService.update(order, response);
	}
	
	@RequestMapping("/edit")
	public String edit(int id, HttpServletRequest request) {
		return orderService.selectById(id, request);
	}
	
	@RequestMapping("/list")
	public void list(Order order, HttpServletRequest request) {
		orderService.selectList(order, request);
	}

}
