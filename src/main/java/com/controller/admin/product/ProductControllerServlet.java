package com.controller.admin.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.data.DAOs.ProductDAO;
import com.model.Product;

@WebServlet("/admin/product")
public class ProductControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;
    private String status;
    @Override
	public void init() throws ServletException {
		super.init();
		try {
			productDAO = new ProductDAO();
		}
		catch(Exception ex) {
			throw new ServletException(ex);
		}
	}
	public ProductControllerServlet() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String theCommand = request.getParameter("command");
			if(theCommand == null)
				theCommand = "LIST";
			switch(theCommand) {
				case "Product":
					listProduct(request, response);
					break;
				case "ADD":
					addProduct(request, response);
					break;
				case "Load":
					loadProduct(request, response);
					break;
				case "Update":
					updateProduct(request, response);
					break;
				case "Delete":
					deleteProduct(request, response);
				default:
					listProduct(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		productDAO.deleteProduct(id);
		listProduct(request, response);
		
	}
	private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String nameAuthor = request.getParameter("author");
		String nxb = request.getParameter("nxb");
		String nameItem = request.getParameter("nameItem");
		String description = request.getParameter("description");
		int price = Integer.parseInt(request.getParameter("price"));
		int id = Integer.parseInt(request.getParameter("id"));
		String supplier = request.getParameter("supplier");
		Product theProduct = new Product(id ,nameAuthor, description, nameItem, nxb, supplier, price);
		productDAO.updateProducts(theProduct);
		listProduct(request, response);
		
	}
	private void loadProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String theProductId = request.getParameter("id");
		Product theProduct = productDAO.getProduct(Integer.parseInt(theProductId));
		request.setAttribute("item", theProduct);
		request.getRequestDispatcher("loadForm.jsp").forward(request, response);
	}
	private void addProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		int price = Integer.parseInt(request.getParameter("price"));
		Product theProduct = new Product(name, description, price, "");
		productDAO.addProducts(theProduct);
		listProduct(request, response);
	}
	private void listProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Product> product = null;
		try {
			product = productDAO.getProducts();
			request.setAttribute("list", product);
		} catch (Exception e) {
			log("productDao error", e);
		}
		request.getRequestDispatcher("product.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
