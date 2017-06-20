package cn.tr.coalgas.service.transport.impl;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import cn.tr.coalgas.dao.transport.ITransportDao;
import cn.tr.coalgas.entity.Transport;
import cn.tr.coalgas.service.transport.ITransportService;

/**
 * 
 * 输送类业务层实现
 * 
 * @author taorun
 * @date 2017年5月18日 下午5:10:35
 * 
 */

@Service
public class TransportService implements ITransportService {
	
	@Resource
	private ITransportDao transportDao;

	public void selectList(Transport record, HttpServletRequest request) {
		DecimalFormat df = new DecimalFormat("0.00");
		double sumAmount = 0;
		double sumPrice = 0;
		List<Transport> transport_list = transportDao.selectList(record);
		for (Transport transport : transport_list) {
			sumAmount += transport.getAmount();
			sumPrice += transport.getTotalPrice();
		}
		double averagePrice = 0;
		if (sumAmount != 0) {
			averagePrice = sumPrice / sumAmount;
		}
		request.setAttribute("transport_list", transport_list);
		request.setAttribute("sumAmount", df.format(sumAmount));
		request.setAttribute("sumPrice", df.format(sumPrice));
		request.setAttribute("averagePrice", df.format(averagePrice));
	}

	public void insert(Transport transport, HttpServletResponse response) {
		transportDao.insert(transport);
		try {
			response.setCharacterEncoding("GBK");
			response.getWriter().print("<script>alert('新增输送成功');location.href='/coal-gas-system/transport/list?page=1';</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String selectById(int id, HttpServletRequest request) {
		request.setAttribute("transport", transportDao.selectById(id));
		return "transport/edit";
	}

	public void updateById(Transport transport, HttpServletResponse response) {
		transportDao.updateById(transport);
		try {
			response.setCharacterEncoding("GBK");
			response.getWriter().print("<script>alert('修改成功');location.href='/coal-gas-system/transport/list?page=1';</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void delete(Integer id) {
		transportDao.deleteById(id);
	}

}
