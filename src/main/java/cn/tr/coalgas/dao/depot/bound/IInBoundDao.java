package cn.tr.coalgas.dao.depot.bound;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.tr.coalgas.entity.InBound;

/**
 * 
 * 仓库入库数据层接口
 * 
 * @author taorun
 * @date 2017年4月30日 下午4:04:34
 *
 */

@Repository
public interface IInBoundDao {
	
    int deleteById(Integer id);

    int insert(InBound record);

    InBound selectById(Integer id);

    List<InBound> selectList(InBound record);
    
}