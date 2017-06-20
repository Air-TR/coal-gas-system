package cn.tr.coalgas.dao.transport;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.tr.coalgas.entity.Transport;

/**
 * 
 * 输送类数据层接口
 * 
 * @author taorun
 * @date 2017年5月18日 下午5:07:29
 *
 */

@Repository
public interface ITransportDao {
	
    int deleteById(Integer id);

    int insert(Transport record);

    Transport selectById(Integer id);

    int updateById(Transport record);
    
    List<Transport> selectList(Transport record);
    
}