package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.data.DAOs.CartDao;
import com.data.DAOs.ProductDAO;
import com.model.*;


@WebServlet("/payment")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDao;
	private CartDao cartDao;
    public PaymentController() {
    	productDao = new ProductDAO();
    	cartDao = new CartDao();
    }
    /*Text payment
     * So the: 9704198526191432198
     * Ngay phat hanh: 07/15
     * Ten: NGUYEN VAN A
     * OTP: 123456
     * */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	}

	private void goPayment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextUrl = "WEB-INF/payment.jsp";
		String uname = request.getParameter("username");
		List<CardList> cart = cartDao.getCartList(uname);
		request.setAttribute("cart_item", cart);
		request.getRequestDispatcher(nextUrl).forward(request, response);

		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// get current action
			String action = request.getParameter("action");

			if (action == null) {
				action = "Pay";
			}
			switch (action) {
			case "ADD":
				addProductToCart(request, response);
				break;
			case "Pay":
				goPayment(request, response);
				break;
			case "REMOVE":
				removeProductInCart(request, response);
				break;
			default:
				goPayment(request, response);
				break;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void removeProductInCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("cId"));
        cartDao.removeProduct(productId);
        goPayment(request, response);
		
	}
	private void addProductToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("username");
        String productId = request.getParameter("pId");
        String quantityString = request.getParameter("quantity");
        Product product = null;

        product = productDao.getProduct(Integer.parseInt(productId));
        if(!cartDao.checkNameExist(product.codeProduct, uname)) {
            CardList cart = new CardList(product.getCodeProduct(), uname, product.getProductName(), 
            		product.getNameAuthor(), Integer.parseInt(quantityString), product.getPrice());

            cartDao.addToCart(cart);

        }
        
        goPayment(request, response);
	}



	
}
