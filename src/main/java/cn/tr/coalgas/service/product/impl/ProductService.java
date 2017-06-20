package cn.tr.coalgas.service.product.impl;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import cn.tr.coalgas.dao.product.IProductDao;
import cn.tr.coalgas.entity.Product;
import cn.tr.coalgas.service.product.IProductService;

/**
 * 
 * 产品仓库业务层实现
 * 
 * @author taorun
 * @date 2017年4月24日 上午11:38:07
 * 
 */

@Service
public class ProductService implements IProductService {
	
	@Resource
	private IProductDao productDao;

	public void deleteById(int id) {
		productDao.deleteById(id);
	}

	public void insert(Product record, HttpServletResponse response) {
		productDao.insert(record);
		try {
			response.setCharacterEncoding("GBK");
			response.getWriter().println("<script>alert('新增产品成功');location.href='/coal-gas-system/product/list?page=1';</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void update(Product record, HttpServletResponse response) {
		productDao.updateById(record);
		try {
			response.setCharacterEncoding("GBK");
			response.getWriter().println("<script>alert('修改成功');location.href='/coal-gas-system/product/list?page=1';</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public String selectById(int id, HttpServletRequest request) {
		request.setAttribute("product", productDao.selectById(id));
		return "product/edit";
	}

	public void selectList(HttpServletRequest request) {
		DecimalFormat df = new DecimalFormat("0.00");
		double sumAmount = 0;
		double sumPrice = 0;
		List<Product> product_list = productDao.selectList();
		for (Product product : product_list) {
			sumAmount += product.getAmount();
			sumPrice += product.getTotalPrice();
		}
		double averagePrice = 0;
		if (sumAmount != 0) {
			averagePrice = sumPrice / sumAmount;
		}
		request.setAttribute("product_list", product_list);
		request.setAttribute("sumAmount", df.format(sumAmount));
		request.setAttribute("sumPrice", df.format(sumPrice));
		request.setAttribute("averagePrice", df.format(averagePrice));
	}

}
