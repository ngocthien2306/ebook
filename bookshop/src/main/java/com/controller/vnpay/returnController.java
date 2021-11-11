package com.controller.vnpay;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.*;
import java.nio.charset.StandardCharsets;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.data.DAOs.CartDao;
import com.data.DAOs.OrderDAO;
import com.model.CardList;
import com.model.MyProduct;
import com.vnpay.common.Config;


@WebServlet("/return")
public class returnController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CartDao cartDao;
	private OrderDAO orderDao;

    public returnController() {
        cartDao = new CartDao();
		orderDao = new OrderDAO();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextUrl = "WEB-INF/vnpay_return.jsp";
		String vnp_TransactionStatus = "";
        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }

        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }
        String signValue = Config.hashAllFields(fields);
        //String name = request.getParameter("named");
        Object uname = request.getSession().getAttribute("username");
    	CardList cart = null;
        if (signValue.equals(vnp_SecureHash)) {
            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
            	
            	List<CardList> carts = cartDao.getCartList(uname.toString());
				for(Iterator<CardList> i = carts.iterator(); i.hasNext();) {
					cart = i.next();
					MyProduct product = new MyProduct(cart.getName(), cart.getAuthor());
					orderDao.addItemToUser(product);
				}
				cartDao.removeAllProduct(uname.toString());
				request.setAttribute("list", carts);
            	vnp_TransactionStatus = "Success" + uname.toString();
            } else {
            	vnp_TransactionStatus = "Failed";
            }
        } else {
        	vnp_TransactionStatus = "Invalid signature" + uname.toString();
        }
        request.setAttribute("status", vnp_TransactionStatus);
		request.getRequestDispatcher(nextUrl).forward(request, response);
	}




	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
