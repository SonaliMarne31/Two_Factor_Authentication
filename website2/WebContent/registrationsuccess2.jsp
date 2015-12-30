
<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.util.Random"%>


<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.util.Random"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import ="java.sql.CallableStatement" %>
<%@ page import ="java.io.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page import="java.text.SimpleDateFormat" %>

<% 

   String pw2= (String)session.getAttribute( "randpwd" );
   String pw1= (String)session.getAttribute( "upwd" );
   String un= (String)session.getAttribute( "uname" );
   
   String connectionURL = "jdbc:mysql://localhost:3306/usablesec";
   Connection connection = null; 
   Class.forName("com.mysql.jdbc.Driver").newInstance(); 
   connection = DriverManager.getConnection(connectionURL, "root", "root");
 
   Date date1 = (Date)session.getAttribute("timestamp");
   Date date2 = new Date();
   long difference = date2.getTime() - date1.getTime();
   long seconds = TimeUnit.MILLISECONDS.toSeconds(difference);
   Statement stmt1 = connection.createStatement();
   Date date3 = new Date();
   String site="2";
   String command = "INSERT INTO registration_graphical(username,user_password,sys_password,reg_time,date,Site_no) VALUES ('"+un+"','"+pw1+"','"+pw2+"','"+seconds+"','"+date3.toString()+"','"+site+"')";
   stmt1.executeUpdate(command);


   String userName = null;
   if(session.getAttribute("uname") == null){
           response.sendRedirect("loginpage2.html");
   }else userName = (String) session.getAttribute("uname");

%>
    

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
        <style>
        /* Basics */
        html, body {
            width: 100%;
            height: 100%;
            font-family: "Helvetica Neue", Helvetica, sans-serif;
            color: #444;
            -webkit-font-smoothing: antialiased;
            background: #f0f0f0;
            background-image: url("images/regsuccess.jpg");
            background-size: 100% 100%;
        }
        #container {
            position: fixed;
            width: 340px;
            height: 198px;
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
       /* unvisited */
        a:link {
            color: green;
            margin-left: 0px;
       }

        /* visited link */
        a:visited {
            color: green;
            margin-left: 0px;
        }
        
        input[type=submit] {
            float: right;
            margin-right: 20px;
            margin-top: -5px;
            width: 150px;
            height: 30px;
            font-size: 12px;
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
          <script>
        window.location.hash="no-back-button";
        window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
        window.onhashchange=function(){window.location.hash="no-back-button";}
    </script>
    </head>
    <body>
        
  
        
        <div class="container-fluid">
            <div class="row">
               
		
            </div>
                
            <div align="center" class="row">
                <br><br><br><br><br><br><br><br><br><br><br><br>
               <div class="col-md-12">
                    <h3 align="center">Welcome <%=un %> <br><br><div class="col-lg-12">
                    <a href="userHome2.jsp">Logout</a></div></h3>
				</div>
                 
                
       		 </div>
               
        </div>
    </body>
</html>
