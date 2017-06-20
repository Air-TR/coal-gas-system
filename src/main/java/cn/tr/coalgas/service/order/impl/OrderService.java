package cn.tr.coalgas.service.order.impl;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import cn.tr.coalgas.dao.order.IOrderDao;
import cn.tr.coalgas.entity.Order;
import cn.tr.coalgas.service.order.IOrderService;

/**
 * 
 * 订单业务层实现
 * 
 * @author taorun
 * @date 2017年4月24日 下午4:50:43
 * 
 */

@Service
public class OrderService implements IOrderService {
	
	@Resource
	private IOrderDao orderDao;

	public void selectList(Order record, HttpServletRequest request) {
		DecimalFormat df = new DecimalFormat("0.00");
		double sumAmount = 0;
		double sumPrice = 0;
		List<Order> order_list = orderDao.selectList(record);
		for (Order order : order_list) {
			sumAmount += order.getAmount();
			sumPrice += order.getTotalPrice();
		}
		double averagePrice = 0;
		if (sumAmount != 0) {
			averagePrice = sumPrice / sumAmount;
		}
		request.setAttribute("order_list", order_list);
		request.setAttribute("sumAmount", df.format(sumAmount));
		request.setAttribute("sumPrice", df.format(sumPrice));
		request.setAttribute("averagePrice", df.format(averagePrice));
	}

	public String selectById(int id, HttpServletRequest request) {
		Order order = orderDao.selectById(id);
		request.setAttribute("order", order);
		return "order/edit";
	}

	public void insert(Order order, HttpServletResponse response) {
		orderDao.insert(order);
		try {
			response.setCharacterEncoding("GBK");
			response.getWriter().print("<script>alert('新增订单成功');location.href='/coal-gas-system/order/list?page=1';</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void update(Order record, HttpServletResponse response) {
		orderDao.updateById(record);
		try {
			response.setCharacterEncoding("GBK");
			response.getWriter().print("<script>alert('修改订单成功');location.href='/coal-gas-system/order/list?page=1';</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void finish(Order record) {
		orderDao.updateById(record);
	}

	public void delete(Integer id) {
		orderDao.deleteById(id);
	}

}
