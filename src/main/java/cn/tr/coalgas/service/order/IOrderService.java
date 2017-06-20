package cn.tr.coalgas.service.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tr.coalgas.entity.Order;

/**
 * 
 * 订单业务层接口
 * 
 * @author taorun
 * @date 2017年4月24日 下午4:49:23
 * 
 */

public interface IOrderService {
	
	void selectList(Order order, HttpServletRequest request);
	
	String selectById(int id, HttpServletRequest request);

	void insert(Order order, HttpServletResponse response);

	void update(Order order, HttpServletResponse response);

	void finish(Order order);

	void delete(Integer id);

}
