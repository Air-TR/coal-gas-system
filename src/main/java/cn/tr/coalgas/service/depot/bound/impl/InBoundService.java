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
import cn.tr.coalgas.dao.depot.bound.IInBoundDao;
import cn.tr.coalgas.entity.Depot;
import cn.tr.coalgas.entity.InBound;
import cn.tr.coalgas.service.depot.bound.IInBoundService;

/**
 * 
 * 仓库入库业务层实现
 * 
 * @author taorun
 * @date 2017年4月30日 下午5:48:52
 * 
 */

@Service
public class InBoundService implements IInBoundService {
	
	@Resource
	private IInBoundDao inBoundDao;
	
	@Resource
	private IDepotDao depotDao;

	public void insert(InBound inBound, HttpServletResponse response) {
		SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String strDate = inBound.getDateTtime().split("T")[0];
		String strTime = inBound.getDateTtime().split("T")[1];
		try {
			inBound.setInBoundDate(new Date(sdfDate.parse(strDate + " " + strTime).getTime()));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		Depot depot = depotDao.selectById(inBound.getDepotId());
		depot.setTotalAmount(depot.getTotalAmount() + inBound.getAmount());
		depotDao.updateById(depot);
		inBoundDao.insert(inBound);
		try {
			response.setCharacterEncoding("GBK");
			response.getWriter().print("<script>alert('入库成功'); location.href='/coal-gas-system/depot/list?page=1';</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String selectList(InBound inBound, HttpServletRequest request) {
		DecimalFormat df = new DecimalFormat("0.00");
		double sumAmount = 0;
		double sumPrice = 0;
		List<InBound> inBound_list = inBoundDao.selectList(inBound);
		for (InBound inBound2 : inBound_list) {
			sumAmount += inBound2.getAmount();
			sumPrice += inBound2.getTotalPrice();
		}
		request.setAttribute("inBound_list", inBound_list);
		request.setAttribute("sumAmount", df.format(sumAmount));
		request.setAttribute("sumPrice", df.format(sumPrice));
		double averagePrice = 0;
		if (sumPrice != 0) {
			averagePrice = sumPrice / sumAmount;
		}
		request.setAttribute("averagePrice", df.format(averagePrice));
		return "/depot/inbound/history";
	}

	public void deleteById(int id) {
		inBoundDao.deleteById(id);
	}

	public String selectById(int id, HttpServletRequest request) {
		request.setAttribute("inbound", inBoundDao.selectById(id));
		return "/depot/inbound/detail";
	}

}
