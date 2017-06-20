package cn.tr.coalgas.dao.depot;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.tr.coalgas.entity.Depot;

/**
 * 
 * 原料仓库数据层接口
 * 
 * @author taorun
 * @date 2017年4月13日 下午6:10:50
 *
 */

@Repository
public interface IDepotDao {
	
    int deleteById(Integer id);

    int insert(Depot record);

    Depot selectById(Integer id);

    int updateById(Depot record);
    
    List<Depot> selectList(Depot depot);

}