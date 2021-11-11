package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DTOs.BusinessDtos.RegisterDTO;
import com.model.User;

@WebServlet("/verify")
public class VerifyController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nextUrl = "WEB-INF/verify.jsp";

        // get current action
        String action = request.getParameter("action");

        if (action == null) {
            action = "Go to verify.jsp";
        }

        if (action.equals("VERIFY")) {
            HttpSession session = request.getSession();
            Object ob = session.getAttribute("registerDTO");
            RegisterDTO registerDTO = (RegisterDTO) ob;
            String code = request.getParameter("code");

            if (new User().verify(registerDTO, code)) {
                request.getSession().setAttribute("username", registerDTO.getUsername());
                response.sendRedirect("home");
                return;
            } else {
                request.setAttribute("verifyMessage", registerDTO.getErrorMessage());
            }
        }

        request.getRequestDispatcher(nextUrl).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
