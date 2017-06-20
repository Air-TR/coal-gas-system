package cn.tr.coalgas.dao.monitorhistory;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.tr.coalgas.entity.MonitorHistory;

@Repository
public interface IMonitorHistoryDao {
	
    int deleteById(Integer id);

    int insert(MonitorHistory record);
    
    void batchInsert(List<MonitorHistory> list);

    MonitorHistory selectById(Integer id);

    int updateById(MonitorHistory record);
    
    List<MonitorHistory> selectList(MonitorHistory record);

}