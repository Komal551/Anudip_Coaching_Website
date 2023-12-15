package com.project.servlet;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.project.entities.*;
import com.project.helper.*;

import com.project.userdao.*;

/**
 * Servlet implementation class BookDemoServlet
 */
public class BookDemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookDemoServlet() {
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
		
		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String check = request.getParameter("check");
		out.println(check);
		
		//fetch all data
			
			String name = request.getParameter("user_name");
			String email  = request.getParameter("user_email");
			String standard = request.getParameter("user_standard");
			String subject = request.getParameter("user_subject");

			BookDemo demo = new BookDemo(0,name,email,standard,subject);
			
			
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			  if(dao.BookDemoClass(demo)) {
				//save
				  out.println("Done...");
			   }else {
				out.println("error..");
		    	}
			  
		    Message msg = new Message("Booked Successfully","success","alert-success");
				
			HttpSession s = request.getSession(); 
			s.setAttribute("msg", msg);
			response.sendRedirect("index.jsp"); 
			  
	}

}
