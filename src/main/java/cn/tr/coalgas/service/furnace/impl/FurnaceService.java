package cn.tr.coalgas.service.furnace.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;

import cn.tr.coalgas.dao.furnace.IFurnaceDao;
import cn.tr.coalgas.dao.monitorhistory.IMonitorHistoryDao;
import cn.tr.coalgas.entity.Furnace;
import cn.tr.coalgas.entity.MonitorHistory;
import cn.tr.coalgas.service.furnace.IFurnaceService;

/**
 * 
 * 煤炉业务层实现
 * 
 * @author taorun
 * @date 2017年4月16日 下午6:55:31
 * 
 */

@Service
public class FurnaceService implements IFurnaceService {
	
	@Resource
	private IFurnaceDao furnaceDao;
	
	@Resource
	private IMonitorHistoryDao monitorHistoryDao;
	
	public String selectList(HttpServletRequest request) {
		List<Furnace> furnace_list = furnaceDao.selectList();
		request.setAttribute("furnace_list", furnace_list);
		return "furnace/list";
	}

	public void monitor(HttpServletResponse response) throws IOException {
		PrintWriter printWriter = response.getWriter();
		int row = 9; // 记录条数
		double[][] arr = new double[row][2];
		List<MonitorHistory> list = new ArrayList<MonitorHistory>();
		for (int i = 0; i < arr.length; i++) {
			arr[i][0] = Math.random()*200 + 200;
			arr[i][1] = Math.random()*200 + 600;
			MonitorHistory monitorHistory = new MonitorHistory();
			monitorHistory.setTopTemperature(arr[i][0]);
			monitorHistory.setBottomTemperature(arr[i][1]);
			String remark;
			if (arr[i][1] < 610) {
				remark = "过低";
			} else if (arr[i][1] < 620) {
				remark = "偏低";
			} else if (arr[i][1] < 770) {
				remark = "";
			} else if (arr[i][1] < 790) {
				remark = "警告";
			} else {
				remark = "危险";
			}
			monitorHistory.setRemark(remark);
			monitorHistory.setFurnaceId(i + 1);
			list.add(monitorHistory);
		}
		monitorHistoryDao.batchInsert(list);
		String jsonString = JSON.toJSONString(arr); 
		printWriter.println(jsonString);
	}

	public void selectMonitorHistory(MonitorHistory monitorHistory, HttpServletRequest request) {
		List<MonitorHistory> monitorHistory_list = monitorHistoryDao.selectList(monitorHistory);
		request.setAttribute("monitorHistory_list", monitorHistory_list);
	}

}
