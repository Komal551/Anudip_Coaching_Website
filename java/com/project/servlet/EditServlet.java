package com.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.project.entities.*;
import com.project.helper.*;

import com.project.userdao.*;

/**
 * Servlet implementation class EditServlet
 */
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
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
	        
	        // Fetch all data
	        String userEmail = request.getParameter("user_email");
	        String userName = request.getParameter("user_name");
	        String userPassword = request.getParameter("user_password");
	        Part part = request.getPart("image");
	        
	        String imageName = part.getSubmittedFileName();
	        
	        // Get the user from session
	        HttpSession session = request.getSession();
	        UserInfo user = (UserInfo) session.getAttribute("currUser");
	        
	        if (user != null) {
	            user.setEmail(userEmail);
	            user.setName(userName);
	            user.setPassword(userPassword);
	            user.setProfile(imageName);
	            
	            // Update database
	            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
	            boolean isUpdated = userDao.updateUser(user);
	            
	            if (isUpdated) {
	                String basePath = getServletContext().getRealPath("/");
	                String imagePath = basePath + "pics" + File.separator + user.getProfile();
	                
	                // Delete old profile image
	                String oldImagePath = basePath + "pics" + File.separator + imageName;
	                Helper.deleteFile(oldImagePath);
	                
	                // Save new profile image
	                Helper.saveFile(part.getInputStream(), imagePath);
	                    Message msg = new Message("Profile details updated successfully!", "Success", "alert-success");
	                    session.setAttribute("msg", msg);
	            } 
	        } else {
	            Message msg = new Message("User session not found.", "Error", "alert-danger");
	            session.setAttribute("msg", msg);
	        }
	        
	        response.sendRedirect("index.jsp");
	}

}
