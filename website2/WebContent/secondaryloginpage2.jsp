

  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import ="java.sql.CallableStatement" %>
<%@ page import ="java.io.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page import="java.text.SimpleDateFormat" %>

<% 
String flg= (String)session.getAttribute( "flag" );
int att=1;
if(flg == "0") {
String name = request.getParameter( "username" );
session.setAttribute( "uname", name );

session.setAttribute( "attempt", att );
}


if (flg != "0") {
	int at= (int)session.getAttribute( "attempt" );
	att=at+1;
	session.setAttribute( "attempt", att );
}
Date date= new Date();
//getTime() returns current time in milliseconds
long time = date.getTime();
//Passed the milliseconds to constructor of Timestamp class 
Timestamp ts = new Timestamp(time);
session.setAttribute( "timestamp2", date );

%>
    
<%
	String connectionURL = "jdbc:mysql://localhost:3306/usablesec";
	Connection connection = null; 
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	connection = DriverManager.getConnection(connectionURL, "root", "root");
	String name = (String)session.getAttribute("uname");
	//session.setAttribute( "username", name );
	String site="2";
	session.setAttribute( "timestamp", date );
	PreparedStatement pst = connection.prepareStatement("Select username from registration_graphical where username=? and Site_no=?");
	pst.setString(1, name);
	pst.setString(2, site);

	ResultSet rs = pst.executeQuery();   

   	if(!rs.next())  {        
   	 	session.setAttribute("loginflag", "1");
	    response.sendRedirect("loginpage2.jsp");
   	} 
   	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>


  <script>
        window.location.hash="no-back-button";
        window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
        window.onhashchange=function(){window.location.hash="no-back-button";}
    </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>uSec - Secondary Login</title>
        <style>
        /* Basics */
        html, body {
            width: 100%;
            height: 100%;
            font-family: "Helvetica Neue", Helvetica, sans-serif;
            color: #444;
            -webkit-font-smoothing: antialiased;
            background: #f0f0f0;
            background-image: url("images/homegoogle.jpg");
            background-size: 100% 100%;
        }
        #container {
            position: fixed;
            width: 340px;
            height: 295px;
            top: 55%;
            left: 50%;
            margin-top: -120px;
            margin-left: -170px;
            background: #fff;
            border-radius: 3px;
            border: 1px solid #ccc;
            box-shadow: 0 1px 2px rgba(0, 0, 0, .1);

        }
        form {
            margin: 0 auto;
            margin-top: 20px;
        }
        label {
            color: #555;
            display: inline-block;
            margin-left: 18px;
            padding-top: 10px;
            font-size: 14px;
        }
        p a {
            font-size: 11px;
            color: #aaa;
            float: right;
            margin-top: -13px;
            margin-right: 20px;
         -webkit-transition: all .4s ease;
            -moz-transition: all .4s ease;
            transition: all .4s ease;
        }
        p a:hover {
            color: #555;
        }
        input {
            font-family: "Helvetica Neue", Helvetica, sans-serif;
            font-size: 12px;
            outline: none;
        }
        input[type=text], input[type=email],
        input[type=password] ,input[type=time]{
            color: #777;
            padding-left: 10px;
            margin: 10px;
            margin-top: 12px;
            margin-left: 18px;
            width: 290px;
            height: 35px;
            border: 1px solid #c7d0d2;
            border-radius: 2px;
            box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .4), 0 0 0 5px #f5f7f8;
            -webkit-transition: all .4s ease;
            -moz-transition: all .4s ease;
            transition: all .4s ease;
            }
        input[type=text]:hover,
        input[type=password]:hover,input[type=time]:hover {
            border: 1px solid #b6bfc0;
            box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .7), 0 0 0 5px #f5f7f8;
        }
        input[type=text]:focus,
        input[type=password]:focus,input[type=time]:focus {
            border: 1px solid #a8c9e4;
            box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .4), 0 0 0 5px #e6f2f9;
        }
        
        #lower {
            background: #ecf2f5;
            width: 100%;
            height: 69px;
            margin-top: 20px;
              box-shadow: inset 0 1px 1px #fff;
            border-top: 1px solid #ccc;
            border-bottom-right-radius: 3px;
            border-bottom-left-radius: 3px;
        }
        input[type=checkbox] {
            margin-left: 20px;
            margin-top: 30px;
        }
        .check {
            margin-left: 3px;
            font-size: 11px;
            color: #444;
            text-shadow: 0 1px 0 #fff;
        }
        input[type=submit] {
            //float: right;
            margin-right: 0px;
            margin-top: 20px;
            margin-left: 120px;
            width: 80px;
            height: 30px;
            font-size: 14px;
            font-weight: bold;
            color: #fff;
            background-color: #acd6ef; /*IE fallback*/
            background-image: -webkit-gradient(linear, left top, left bottom, from(#acd6ef), to(#6ec2e8));
            background-image: -moz-linear-gradient(top left 90deg, #acd6ef 0%, #6ec2e8 100%);
            background-image: linear-gradient(top left 90deg, #acd6ef 0%, #6ec2e8 100%);
            border-radius: 30px;
            border: 1px solid #66add6;
            box-shadow: 0 1px 2px rgba(0, 0, 0, .3), inset 0 1px 0 rgba(255, 255, 255, .5);
            cursor: pointer;
        }
   
       
        input[type=submit]:hover {
            background-image: -webkit-gradient(linear, left top, left bottom, from(#b6e2ff), to(#6ec2e8));
            background-image: -moz-linear-gradient(top left 90deg, #b6e2ff 0%, #6ec2e8 100%);
            background-image: linear-gradient(top left 90deg, #b6e2ff 0%, #6ec2e8 100%);
        }
        input[type=submit]:active {
            background-image: -webkit-gradient(linear, left top, left bottom, from(#6ec2e8), to(#b6e2ff));
            background-image: -moz-linear-gradient(top left 90deg, #6ec2e8 0%, #b6e2ff 100%);
            background-image: linear-gradient(top left 90deg, #6ec2e8 0%, #b6e2ff 100%);
        }
        </style>
        </head>

        <body>
            
            <!-- Begin Page Content -->
            <div id="container">
                <form method="post" action="loginsuccess2.jsp" >
                      <%   if (flg != "0") {
				
				out.write("<p align=\"center\" style=\"color:red\">Wrong password</p>");
				 
			} 
			%>     
                     <div class="row">
                        <div class="col-md-12">
                        <h3 align="center">Login</h3>
            </div>
            </div>  
                    <label for="primarypassword">Primary Password :</label>
                    <input type="password" id="primarypassword" name="primarypassword" >
                    <span id="confirmMessage1" class="confirmMessage"></span>
                    <label for="password">Secondary Password:</label>
                    <input type="password" id="secondarypassword" name="secondarypassword" >
                    <span id="confirmMessage2" class="confirmMessage"></span>
                    
                    <div id="lower">
                
                        <input type="submit" id="Login" value="Login">
                    </div><!--/ lower-->
                    
                </form>
            </div>
            <!-- End Page Content -->
        </body>
        </html>