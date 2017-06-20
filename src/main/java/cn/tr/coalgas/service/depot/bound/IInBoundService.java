package cn.tr.coalgas.service.depot.bound;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tr.coalgas.entity.InBound;

/**
 * 
 * 仓库入库业务层接口
 * 
 * @author taorun
 * @date 2017年4月30日 下午5:48:20
 * 
 */

public interface IInBoundService {

	void insert(InBound inBound, HttpServletResponse response);

	String selectList(InBound inBound, HttpServletRequest request);

	void deleteById(int id);

	String selectById(int id, HttpServletRequest request);

}
