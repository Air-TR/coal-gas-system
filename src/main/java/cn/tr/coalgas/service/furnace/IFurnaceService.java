package cn.tr.coalgas.service.furnace;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tr.coalgas.entity.MonitorHistory;

/**
 * 
 * 煤炉业务层接口
 * 
 * @author taorun
 * @date 2017年4月16日 下午6:54:49
 * 
 */

public interface IFurnaceService {
	
    String selectList(HttpServletRequest request);
    
    void monitor(HttpServletResponse response) throws IOException;
    
	void selectMonitorHistory(MonitorHistory monitorHistory, HttpServletRequest request);

}
