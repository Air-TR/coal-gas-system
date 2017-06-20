package cn.tr.coalgas.service.depot;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tr.coalgas.entity.Depot;

/**
 * 
 * 仓库业务层接口
 * 
 * @author taorun
 * @date 2017年4月13日 下午6:16:26
 * 
 */

public interface IDepotService {
	
	void deleteById(Integer id);

    void insert(Depot record, HttpServletResponse response);

    String selectById(Integer id, HttpServletRequest request);
    
    void updateById(Depot record, HttpServletResponse response);
    
    String selectList(Depot depot, HttpServletRequest request);

	String checkIdExist(int id);

	String checkIdUnExist(int id);

	String detail(Integer id, HttpServletRequest request);

}
