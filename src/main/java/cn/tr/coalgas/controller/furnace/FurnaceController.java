package cn.tr.coalgas.controller.furnace;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tr.coalgas.entity.MonitorHistory;
import cn.tr.coalgas.service.furnace.IFurnaceService;

/**
 * 
 * 煤炉控制器
 * 
 * @author taorun
 * @date 2017年4月16日 下午6:58:38
 * 
 */

@Controller
@RequestMapping("/furnace")
public class FurnaceController {
	
	@Resource
	private IFurnaceService furnaceService;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request) {
		return furnaceService.selectList(request);
	}
	
	/**
	 * 监控数据更新
	 * @author taorun
	 * @date 2017年4月18日
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/monitor")
	public void monitor(HttpServletResponse response) throws IOException {
		furnaceService.monitor(response);
	}
	
	@RequestMapping("/history")
	public void history(MonitorHistory monitorHistory, HttpServletRequest request) {
		furnaceService.selectMonitorHistory(monitorHistory, request);
	}

}
