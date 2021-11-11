package com.Filter.admin;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@WebFilter({"/admin/admin-root", "/admin/createAdmin.jsp"})
public class RootAdminFilter implements Filter {

    public RootAdminFilter() {
        
    }

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpSession session = httpRequest.getSession();
		String adminType = "";	
		try {
			adminType = session.getAttribute("adminType").toString();
		}catch(NullPointerException e) {
			request.getRequestDispatcher("NoPermission.jsp").forward(request, response);
			return;
		}
		
		if(!adminType.equals("ROOT")) {
			request.getRequestDispatcher("NoPermission.jsp").forward(request, response);
			return;
		}
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
