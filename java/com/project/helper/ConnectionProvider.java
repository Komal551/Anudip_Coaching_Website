package com.project.helper;

import java.sql.*;

public class ConnectionProvider {
	
    private static Connection con;

    public static Connection getConnection() {
    	
        try {

            if (con == null) {
                //driver class load
                Class.forName("com.mysql.cj.jdbc.Driver");

                //create a connection..
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coachingdetail", "root", "Ayush@321");
                System.out.println("Connected");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
    
    

	 



}
