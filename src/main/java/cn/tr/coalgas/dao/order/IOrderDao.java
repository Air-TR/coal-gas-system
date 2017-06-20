package cn.tr.coalgas.dao.order;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.tr.coalgas.entity.Order;

@Repository
public interface IOrderDao {
	
    int deleteById(Integer id);

    int insert(Order record);

    Order selectById(Integer id);

    int updateById(Order record);
    
    List<Order> selectList(Order record);
    
}