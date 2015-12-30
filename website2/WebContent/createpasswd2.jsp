
      <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import ="java.sql.CallableStatement" %>
<%@ page import ="java.io.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.util.Random"%>


<%
	String connectionURL = "jdbc:mysql://localhost:3306/usablesec";
	Connection connection = null; 
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	connection = DriverManager.getConnection(connectionURL, "root", "root");
	String name = request.getParameter( "username" );
	session.setAttribute( "username", name );
	Date date= new Date();
	//getTime() returns current time in milliseconds
	long time = date.getTime();
	//Passed the milliseconds to constructor of Timestamp class 
	Timestamp ts = new Timestamp(time);
	session.setAttribute( "timestamp", date );
	String site="2";
	PreparedStatement pst = connection.prepareStatement("Select username from usertable where username=?");
	pst.setString(1, name);
	ResultSet rs = pst.executeQuery();   

	PreparedStatement pst1 = connection.prepareStatement("Select username from registration_graphical where username=? and Site_no=?");
	pst1.setString(1, name);
	pst1.setString(2, site);
	ResultSet rs1 = pst1.executeQuery();  
	
	
   	if(rs.next() && !rs1.next() )  {        
   		
   	} 
   	else
   	{
	
	   session.setAttribute("userflag", "1");
	   response.sendRedirect("userHome2.jsp");
   	}
%>





        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>uSec - Registration</title>
        <style>
        /* Basics */
        html, body {
            width: 100%;
            height: 100%;
            font-family: "Helvetica Neue", Helvetica, sans-serif;
            color: #444;
            -webkit-font-smoothing: antialiased;
            background: #f0f0f0;
            background-image: url("images/googlereg.jpg");
            background-size: 100% 100%;
        }
        #container {
            position: fixed;
            width: 340px;
            height: 300px;
            top: 40%;
            left: 65%;
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
        input[type=text],
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
            float: right;
            margin-right: 130px;
            margin-top: 20px;
            width: 80px;
            height: 30px;
            font-size: 14px;
            font-weight: bold;
            color: #fff;
            
            border-radius: 30px;
            border: 1px solid #66add6;
            box-shadow: 0 1px 2px rgba(0, 0, 0, .3), inset 0 1px 0 rgba(255, 255, 255, .5);
            cursor: pointer;
        }
        
         input[type=submit]:enabled{
            
            background-color: #acd6ef; /*IE fallback*/
            background-image: -webkit-gradient(linear, left top, left bottom, from(#acd6ef), to(#6ec2e8));
            background-image: -moz-linear-gradient(top left 90deg, #acd6ef 0%, #6ec2e8 100%);
            background-image: linear-gradient(top left 90deg, #acd6ef 0%, #6ec2e8 100%);
        }
        
        input[type=submit]:disabled{
            
            background-color: lightgray; /*IE fallback*/
            background-image: -webkit-gradient(linear, left top, left bottom, from(lightgray), to(lightgray));
            background-image: -moz-linear-gradient(top left 90deg, tomato 0%, lightgray 100%);
            background-image: linear-gradient(top left 90deg, lightgray 0%, lightgray 100%);
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
    
        function checkPass1()
        {
            //Store the password field objects into variables ...
            var pass1 = document.getElementById('primarypassword');
            //Store the Confimation Message Object ...
            
            var message = document.getElementById('confirmMessage1');
            //Set the colors we will be using ...
            var goodColor = "#66cc66";
            var badColor = "#ff6666";
            //Compare the values in the password field 
            //and the confirmation field
            //alert(document.getElementById('primarypassword').value.length)
            if(document.getElementById('primarypassword').value.length >= 8){
            	
                //The passwords length should be 5 or more. 
                //Set the color to the good color and inform
                //the user that they have entered the correct password 
                pass1.style.backgroundColor = goodColor;
                message.style.color = goodColor;
                message.innerHTML = "Good Password !!"
            }else{
                //The passwords do not match.
                //Set the color to the bad color and
                //notify the user.
                pass1.style.backgroundColor = badColor;
                message.style.color = badColor;
                message.innerHTML = "Password should be minimum 8 characters !!"
                document.getElementById('Proceed').disabled = true;
            }
        }  
        
        
        
        function checkPass2()
        {
            //Store the password field objects into variables ...
            var pass1 = document.getElementById('primarypassword');
            var pass2 = document.getElementById('cpass');
           
            //alert(pass3)
            //Store the Confimation Message Object ...
            var message = document.getElementById('confirmMessage2');
            //Set the colors we will be using ...
            var goodColor = "#66cc66";
            var badColor = "#ff6666";
            //Compare the values in the password field 
            //and the confirmation field
            
           
            if(pass1.value == pass2.value){
                //The passwords match. 
                //Set the color to the good color and inform
                //the user that they have entered the correct password 
                pass2.style.backgroundColor = goodColor;
                message.style.color = goodColor;
                message.innerHTML = "Passwords Match!"
                document.getElementById('Proceed').disabled = false;
                
                
                
            }else{
                //The passwords do not match.
                //Set the color to the bad color and
                //notify the user.
                pass2.style.backgroundColor = badColor;
                message.style.color = badColor;
                document.getElementById('Proceed').disabled = true;
                message.innerHTML = "Passwords Do Not Match!"
            }
        }  
        
        
        
        
        </script>
        
        
        
        
        </head>

        <body>
            
            <!-- Begin Page Content -->
            <div id="container">
                <form method="post" action="randompwd2.jsp" >
                <div class="row"> 
                  
                    	<h3 align="center">Registration</h3>
                   
                	</div>
                    <label><b>Create your Primary Password</b></label><br><br>
                    <label for="primarypassword">Password:</label>
                    <input type="password" id="primarypassword" name="primarypassword" placeholder="Minimum length 8 characters"  onblur="checkPass1(); return false;">
                    <span id="confirmMessage1" class="confirmMessage"></span>
                    <label for="cpassword">Confirm Password:</label>
                    <input type="password" id="cpass" name="cpassword" placeholder="Confirm the above password" onkeyup="checkPass2(); return false;">
                    <span id="confirmMessage2" class="confirmMessage"></span>
                    
                    <div id="lower">
                        
                        <input type="submit" id="Proceed" disabled="true">
                    </div><!--/ lower-->
                </form>
            </div><!--/ container-->
            <!-- End Page Content -->
        </body>
        </html>