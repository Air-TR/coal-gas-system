package cn.tr.coalgas.service.dry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tr.coalgas.entity.Dry;

/**
 * 
 * 
 * 
 * @author taorun
 * @date 2017年4月24日 上午9:47:56
 * 
 */

public interface IDryService {
	
	void selectList(Dry dry, HttpServletRequest request);

	void insert(Dry dry, HttpServletResponse response);

	String edit(int id, HttpServletRequest request);

	void update(Dry dry, HttpServletResponse response);

	void deleteById(int id);
	
}
