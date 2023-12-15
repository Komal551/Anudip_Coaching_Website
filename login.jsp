<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.project.entities.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="loginpage.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Sign Up</title>
</head>
<body>


    <div class="slant">
    <header class="container1">
        <nav class="navbar"><ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Terms & Conditions</a></li>
            <li><a href="#">Privacy Policy</a></li>
            <div class="buttonsbox">
        <button class="acc" ><a href="SignUp.jsp"><i class="fa fa-user-plus"  ></i> Create an Account</a></button>
            </div>
        </ul></nav>
    </header>
    <div class="createaccount">
    </div>
 <div class="formbox">
    <form action="LogInServlet" method ="POST">
        <h1>Log In</h1>
        
        <%
	    Message m = (Message) session.getAttribute("msg");
	    if (m != null) {
	    %>

	    <div class="alert <%=m.getCssclass()%>">
	    	<%=m.getContent()%>
	    </div>

	   <%
	   }
	    session.removeAttribute("msg");
	   %>
        
        <ul>
        <li><input type="email" name="email" id="" class="fa" placeholder="&#xf003; Email Address"></li>
        <li><input type="password" name="password" id="" class="fa" placeholder="&#xf084; Password"></li>
    </ul>
    <div class="createbtn">
    <button class="btn">Submit</button>
</div>
    </form> 
 </div>
 <div class="ask last" ><a href="SignUp.jsp">Don't have an Account? Sign Up</a></div>
 <!-- <div class="repassword, last"><a href="">Forgot Password</a></div> -->
</div>
</body>
</html>