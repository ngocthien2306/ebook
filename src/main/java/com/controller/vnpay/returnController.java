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
import com.data.DAOs.HistoryDao;
import com.data.DAOs.OrderDAO;
import com.model.CardList;
import com.model.History;
import com.model.MyProduct;
import com.vnpay.common.Config;


@WebServlet("/return")
public class returnController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CartDao cartDao;
	private OrderDAO orderDao;
	private HistoryDao hisDao;

    public returnController() {
        cartDao = new CartDao();
		orderDao = new OrderDAO();
		hisDao = new HistoryDao();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextUrl = "WEB-INF/vnpay_return.jsp";
		String vnp_TransactionStatus = "";
		//hash attribute
        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }
        //get attribute
        double amount = Integer.parseInt(request.getParameter("vnp_Amount"));
        String code = request.getParameter("vnp_TransactionNo");
        String day = request.getParameter("vnp_PayDate");
        String info = request.getParameter("vnp_OrderInfo");
        String bank = request.getParameter("vnp_BankCode");
        String transId = request.getParameter("vnp_TxnRef");
        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }
        String signValue = Config.hashAllFields(fields);
        String name = "";
        Object uname = request.getSession().getAttribute("username");
        if(uname == null) {
        	name = "";
        }
        else {
        	name = uname.toString();
        }
    	CardList cart = null;
        if (signValue.equals(vnp_SecureHash)) {
            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
            	
            	List<CardList> carts = cartDao.getCartList(name);
				for(Iterator<CardList> i = carts.iterator(); i.hasNext();) {
					cart = i.next();
					MyProduct product = new MyProduct(name, cart.getAuthor(), cart.getName());
					orderDao.addItemToUser(product);
				}
				cartDao.removeAllProduct(name);
				request.setAttribute("list", carts);
				History his = new History(name, code, transId, info, amount, bank, day);
				hisDao.addBillofUser(his);
            	vnp_TransactionStatus = "Success";
            } else {
            	vnp_TransactionStatus = "Failed";
            }
        } else {
        	vnp_TransactionStatus = "Invalid signature" + name;
        }
        request.setAttribute("status", vnp_TransactionStatus);
		request.getRequestDispatcher(nextUrl).forward(request, response);
	}




	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
