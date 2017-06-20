package cn.tr.coalgas.controller.product;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tr.coalgas.entity.Product;
import cn.tr.coalgas.service.product.IProductService;

/**
 * 
 * 产品仓库控制器
 * 
 * @author taorun
 * @date 2017年4月24日 上午11:43:13
 * 
 */

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Resource
	private IProductService productService;
	
	@RequestMapping("/add")
	public String add() {
		return "product/add";
	}
	
	@RequestMapping("/insert")
	public void insert(Product product, HttpServletResponse response) {
		productService.insert(product, response);
	}
	
	@RequestMapping("/update")
	public void update(Product product, HttpServletResponse response) {
		productService.update(product, response);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(int id) {
		productService.deleteById(id);
	}
	
	@RequestMapping("/edit")
	public String edit(int id, HttpServletRequest request) {
		return productService.selectById(id, request);
	}
	
	@RequestMapping("/list")
	public void list(HttpServletRequest request) {
		productService.selectList(request);
	}

}
