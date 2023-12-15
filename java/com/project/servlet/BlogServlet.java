package com.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.project.entities.Comment;
import com.project.entities.Message;
import com.project.helper.ConnectionProvider;
import com.project.userdao.UserDao;

/**
 * Servlet implementation class BlogServlet
 */
public class BlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogServlet() {
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
		
		
		String name = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String url = request.getParameter("user_url");
		String message = request.getParameter("user_message");
		
		Comment c = new Comment(name,email,url,message);
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		if(dao.LeaveComment(c)) {
			out.println("Leave comment Done....");
		}else {
			out.println("Not Done....");
		}
		
		Message msg = new Message("Leave Comment Successfully!!","success","alert-success");
	    HttpSession s = request.getSession(); 
		s.setAttribute("msg", msg);
		response.sendRedirect("single.jsp"); 
					  
		
	}

}
