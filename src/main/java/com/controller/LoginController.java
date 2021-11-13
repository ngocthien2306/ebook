package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DTOs.BusinessDtos.LoginDTO;
import com.data.DAOs.UserDAO;
import com.model.User;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDao = null;
	
	public LoginController() {
		super();
		userDao = new UserDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nextUrl = "admin/login.jsp";
		// get current action
		String action = request.getParameter("action");

		if (action == null) {
			action = "Go to Login.jsp";
		}

		if (action.equals("LOGIN")) {
			LoginDTO loginDTO = new LoginDTO();
			loginDTO.setUsername(request.getParameter("username"));
			loginDTO.setPassword(request.getParameter("password"));
			if (new User().login(loginDTO)) {
				request.getSession().setAttribute("username", loginDTO.getUsername());
				Object name = request.getSession().getAttribute("username");
				int id = userDao.getUserByUserName(name.toString());
				request.getSession().setAttribute("role", id);
				Cookie username = new Cookie("named", loginDTO.getUsername());
				username.setMaxAge(60*60*24);
				response.addCookie(username);

				response.sendRedirect("home");
				return;
			} else {
				request.setAttribute("loginMessage", "Password or username incorrect");
			}
		}

		request.getRequestDispatcher(nextUrl).forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
