package cn.tr.coalgas.dao.product;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.tr.coalgas.entity.Product;

@Repository
public interface IProductDao {
	
    int deleteById(Integer id);

    int insert(Product record);

    Product selectById(Integer id);

    int updateById(Product record);
    
    List<Product> selectList();
    
}