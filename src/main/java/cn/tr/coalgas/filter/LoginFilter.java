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
 * 登录过滤器
 * 
 * @author taorun
 * @date 2017年4月6日 下午5:57:54
 * 
 */

public class LoginFilter extends OncePerRequestFilter {
	
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		/**
		 * 不过滤的uri
		 * staff/check: ajax验证邮箱手机存在
		 */
		String[] noFilter = new String[]{ "staff/login", "staff/insert", "register", "css", "png", "js", "staff/check" };
		// 请求的uri
		String uri = request.getRequestURI();
		uri = uri.substring(17);
		boolean doFilter = true;
		if (uri.equals("")) {
			doFilter = false;
		} else {
			for(String s : noFilter) {
				if(uri.indexOf(s) != -1) {
					doFilter = false;
					break;
				}
			}
		}
		if(doFilter) {
			// 执行过滤,判断loginUser是否在session里
			Staff staff = (Staff) (request.getSession().getAttribute("user"));
			if(staff == null) {
				// 重定向到登录页
				response.sendRedirect("/coal-gas-system/");
			} else {
				// 放行
				filterChain.doFilter(request, response);
			}
		} else {
			// 直接放行
			filterChain.doFilter(request, response);
		}
	}

}
