package com.project.servlet;

import jakarta.servlet.ServletException;


import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.project.entities.UserInfo;
import com.project.helper.*;
import com.project.userdao.*;

/**
 * Servlet implementation class RegisterServlet
 */

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            String check = request.getParameter("check");

            if (check == null) {
                out.println("Checkbox not checked");
            } else {
                String name = request.getParameter("user_name");
                String email = request.getParameter("user_email");
                String password = request.getParameter("user_password");
                String confirmPassword = request.getParameter("user_confirmpassword");

                if (password.equals(confirmPassword)) {
                    UserInfo user = new UserInfo(0,name, email, password, confirmPassword);

                    UserDao dao = new UserDao(ConnectionProvider.getConnection());
                    if (dao.UserSave(user)) {  
                        out.println("Registration successful!");
                    } else {
                        out.println("Registration failed.");
                    }
                } else {
                    out.println("Passwords do not match.");
                }
            }
        } catch (Exception e) {
            out.println("An error occurred: " + e.getMessage());
            e.printStackTrace();
        }
		
		
	}

}
