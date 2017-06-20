package cn.tr.coalgas.service.depot.bound.impl;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import cn.tr.coalgas.dao.depot.IDepotDao;
import cn.tr.coalgas.dao.depot.bound.IOutBoundDao;
import cn.tr.coalgas.entity.Depot;
import cn.tr.coalgas.entity.OutBound;
import cn.tr.coalgas.service.depot.bound.IOutBoundService;

/**
 * 
 * 仓库出库业务层实现
 * 
 * @author taorun
 * @date 2017年5月5日 上午10:23:31
 * 
 */

@Service
public class OutBoundService implements IOutBoundService {
	
	@Resource
	private IOutBoundDao outBoundDao;
	
	@Resource
	private IDepotDao depotDao;

	public void insert(OutBound outbound, HttpServletResponse response) {
		SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String strDate = outbound.getDateTtime().split("T")[0];
		String strTime = outbound.getDateTtime().split("T")[1];
		try {
			outbound.setOutboundDate(new Date(sdfDate.parse(strDate + " " + strTime).getTime()));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		Depot depot = depotDao.selectById(outbound.getDepotId());
		depot.setTotalAmount(depot.getTotalAmount() - outbound.getAmount());
		depotDao.updateById(depot);
		outBoundDao.insert(outbound);
		try {
			response.setCharacterEncoding("GBK");
			response.getWriter().print("<script>alert('出库成功'); location.href='/coal-gas-system/depot/list?page=1';</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String selectList(OutBound outbound, HttpServletRequest request) {
		DecimalFormat df = new DecimalFormat("0.00");
		double sumAmount = 0;
		double sumPrice = 0;
		List<OutBound> outbound_list = outBoundDao.selectList(outbound);
		for (OutBound outbound2 : outbound_list) {
			sumAmount += outbound2.getAmount();
			sumPrice += outbound2.getTotalPrice();
		}
		request.setAttribute("outbound_list", outbound_list);
		request.setAttribute("sumAmount", df.format(sumAmount));
		request.setAttribute("sumPrice", df.format(sumPrice));
		double averagePrice = 0;
		if (sumPrice != 0) {
			averagePrice = sumPrice / sumAmount;
		}
		request.setAttribute("averagePrice", df.format(averagePrice));
		return "/depot/outbound/history";
	}

	public void deleteById(int id) {
		outBoundDao.deleteById(id);
	}

	public String selectById(int id, HttpServletRequest request) {
		request.setAttribute("outbound", outBoundDao.selectById(id));
		return "/depot/outbound/detail";
	}

}
