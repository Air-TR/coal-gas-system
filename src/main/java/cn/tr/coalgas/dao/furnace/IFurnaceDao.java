package cn.tr.coalgas.dao.furnace;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.tr.coalgas.entity.Furnace;

/**
 * 
 * 煤炉数据层接口
 * 
 * @author taorun
 * @date 2017年4月16日 下午6:57:15
 *
 */

@Repository
public interface IFurnaceDao {
	
    void deleteById(Integer id);

    void insert(Furnace record);

    Furnace selectById(Integer id);

    void updateById(Furnace record);
    
    List<Furnace> selectList();
    
}