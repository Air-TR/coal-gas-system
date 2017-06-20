package cn.tr.coalgas.service.transport;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tr.coalgas.entity.Transport;

/**
 * 
 * 输送类业务层接口
 * 
 * @author taorun
 * @date 2017年5月18日 下午5:06:53
 * 
 */

public interface ITransportService {
	
	String selectById(int id, HttpServletRequest request);
	
	void insert(Transport transport, HttpServletResponse response);
	
	void delete(Integer id);
	
	void selectList(Transport transport, HttpServletRequest request);

	void updateById(Transport transport, HttpServletResponse response);

}
