package cn.tr.coalgas.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

import cn.tr.coalgas.entity.Staff;

/**
 * 
 * 权限过滤器
 * 
 * @author taorun
 * @date 2017年4月11日 下午8:45:02
 * 
 */

public class RoleFilter extends OncePerRequestFilter {
	
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		uri = uri.substring(17);
		
		if(uri.indexOf("staff/list") != -1) {
			// 执行过滤,判断loginUser是否在session里
			Staff staff = (Staff) (request.getSession().getAttribute("user"));
			if(staff.getRole().equals("A") || staff.getRole().equals("B") || staff.getRole().equals("C")) {
				// 放行
				filterChain.doFilter(request, response);
			} else {
				// 重定向到权限不足页
				response.sendRedirect("/coal-gas-system/error_role");
			}
		} else {
			// 直接放行
			filterChain.doFilter(request, response);
		}
	}

}
