package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/productItem")
public class ProductItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductItemController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextUrl = "WEB-INF/productItem.jsp";

		// get current action
		String action = request.getParameter("action");

		if (action == null) {
			action = "Go to productList.jsp";
		}

		if (action.equals("SOMETHING")) {
			example();
		}
		
		request.getRequestDispatcher(nextUrl).forward(request, response);
	}

	private void example() {
		// TODO Auto-generated method stub
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
