package cn.tr.coalgas.service.depot.bound;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tr.coalgas.entity.OutBound;

/**
 * 
 * 仓库出库业务层接口
 * 
 * @author taorun
 * @date 2017年5月5日 上午10:19:40
 * 
 */

public interface IOutBoundService {
	
	void insert(OutBound outbound, HttpServletResponse response);

	String selectList(OutBound outbound, HttpServletRequest request);

	void deleteById(int id);

	String selectById(int id, HttpServletRequest request);

}
