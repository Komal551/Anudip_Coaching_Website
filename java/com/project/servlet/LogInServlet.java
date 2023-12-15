package com.project.servlet;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.project.entities.Message;
import com.project.entities.*;
import com.project.helper.*;
import com.project.userdao.*;

/**
 * Servlet implementation class LogInServlet
 */
public class LogInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogInServlet() {
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
	
		
		
	    response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
//          login 
//            fetch username and password from request
            String userEmail = request.getParameter("email");
            String userPassword = request.getParameter("password");

            UserDao dao = new UserDao(ConnectionProvider.getConnection());

            UserInfo u = (UserInfo) dao.getUserByEmailAndPassword(userEmail, userPassword);

            if (u == null) {
                //login.................
//                error///
//                out.println("Invalid Details..try again");
                Message msg = new Message("Invalid Details ! try with another", "error", "alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);

                response.sendRedirect("login.jsp");
            } else {
                //......
//                login success
                HttpSession s = request.getSession();
                s.setAttribute("currUser", u);
                response.sendRedirect("index.jsp");

            }

            out.println("</body>");
            out.println("</html>");
        }
	}

}
