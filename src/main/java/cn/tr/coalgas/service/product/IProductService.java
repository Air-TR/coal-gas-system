package cn.tr.coalgas.service.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tr.coalgas.entity.Product;

/**
 * 
 * 产品仓库业务层接口
 * 
 * @author taorun
 * @date 2017年4月24日 上午11:29:11
 * 
 */

public interface IProductService {
	
	void deleteById(int id);

    void insert(Product record, HttpServletResponse response);

    String selectById(int id, HttpServletRequest request);

    void update(Product record, HttpServletResponse response);

    void selectList(HttpServletRequest request);

}
