package cn.tr.coalgas.dao.depot.bound;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.tr.coalgas.entity.OutBound;

/**
 * 
 * 仓库出库数据层接口
 * 
 * @author taorun
 * @date 2017年5月5日 上午10:04:08
 *
 */

@Repository
public interface IOutBoundDao {
	
	int deleteById(Integer id);

    int insert(OutBound record);

    OutBound selectById(Integer id);

    List<OutBound> selectList(OutBound record);
    
}