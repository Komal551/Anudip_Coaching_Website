package com.project.userdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.project.entities.*;

public class UserDao {

    private Connection con;

    // Constructor to initialize the connection
    public UserDao(Connection con) {
        super();
        this.con = con;
    }

    public boolean UserSave(UserInfo user) {
        boolean f = false;

        String query = "insert into studentdata(name,email,password,confirmpassword) value(?,?,?,?)";
        try {
            PreparedStatement psmt = this.con.prepareStatement(query);
            psmt.setString(1, user.getName());
            psmt.setString(2, user.getEmail());
            psmt.setString(3, user.getPassword());
            psmt.setString(4, user.getConfirmPassword());

            psmt.executeUpdate();
            f = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    public UserInfo getUserByEmailAndPassword(String email, String password) {
        UserInfo user = null;

        try {
            String query = "SELECT * FROM `studentdata` WHERE email=? AND password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new UserInfo(0, query, query, query, query);
                String name = set.getString("name");
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setProfile(set.getString("profile"));

            } else {
                // Handle the case when no matching user is found
                System.out.println("No user found with the provided email and password.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(UserInfo user) {
        boolean f = false;
        try {

            String query = "update studentdata set name=?,email=?,password=?,profile=? where id=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getProfile());
            p.setInt(5, user.getId());

            p.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean BookDemoClass(BookDemo bookdemo) {
        boolean f = false;

        try {

            String query = "insert into bookdemoclass(name,email,standard,subject) value(?,?,?,?)";
            PreparedStatement psmt = this.con.prepareStatement(query);
            psmt.setString(1, bookdemo.getName());
            psmt.setString(2, bookdemo.getEmail());
            psmt.setString(3, bookdemo.getStandard());
            psmt.setString(4, bookdemo.getSubject());

            psmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }
    
    public boolean LeaveComment(Comment comment) {
    	boolean f = false;
    	
    	try {
    		String query = "insert into leavecomment(name,email,url,message) value(?,?,?,?)";
    		PreparedStatement psmt = this.con.prepareStatement(query);
    		psmt.setString(1, comment.getName());
    		psmt.setString(2, comment.getEmail());
    		psmt.setString(3, comment.getUrl());
    		psmt.setString(4, comment.getMessage());
    		
    		
    		psmt.executeUpdate();
    		f = true;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
   	   	
    	return f;
    	
    }

}
