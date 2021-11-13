package com.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.data.Seed;
import com.data.DAOs.CartDao;
import com.data.DAOs.OrderDAO;
import com.data.DAOs.ProductDAO;
import com.model.CardList;
import com.model.MyProduct;
import com.model.Product;

@WebServlet("/home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDao;

	@Override
	public void init() throws ServletException {
		super.init();
		try {
			productDao = new ProductDAO();

		} catch (Exception ex) {
			throw new ServletException(ex);
		}
	}

	public HomeController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String theCommand = request.getParameter("command");
			if (theCommand == null) {
				theCommand = "HOME";
			}
			switch (theCommand) {
			case "HOME":
				//new Seed().doSeed();
				request.setAttribute("username", request.getSession().getAttribute("username"));
				goHomePage(request, response);
				break;
			case "LOAD":
				detailProduct(request, response);
				break;
			default:
				goHomePage(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void detailProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String productId = null;
		Product product = null;
		try {
			productId = request.getParameter("productID");
			product = productDao.getProduct(Integer.parseInt(productId));
		} catch (Exception e) {
			log("productDao error", e);
		}
		request.setAttribute("product", product);
		request.getRequestDispatcher("WEB-INF/productItem.jsp").forward(request, response);
	}

	private void goHomePage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Product> product = null;
		try {
			product = productDao.getProducts();
		} catch (Exception e) {
			log("productDao error", e);
		}
		request.setAttribute("list_product", product);
		request.getRequestDispatcher("WEB-INF/home.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
