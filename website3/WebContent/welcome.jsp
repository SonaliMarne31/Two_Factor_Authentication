<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>uSec - User Profile</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    </head>
    <body>
        
        <%
        //allow access only if session exists
        String userName = null;
        if(session.getAttribute("username") == null){
                response.sendRedirect("loginpage.html");
        }else userName = (String) session.getAttribute("username");
        
        %>
        
        <div class="container-fluid">
            <div class="row">  
		<div class="col-md-12">
                    <h3 align="center">Welcome <%=userName %> <br><br><div class="col-lg-12"><a href="LogoutServlet"><b>Logout</b></a></div></h3>
		</div>
                
            </div>
            <div align="center" class="row">
                
                <img src="images/loginsuccess.jpg">
                
            </div>
        </div>
    </body>
</html>
