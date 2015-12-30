
<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.util.Random"%>
<% 

  
 

  
   String pw2= (String)session.getAttribute( "randpwd" );
    
    
    %>
    


<!DOCTYPE html>
<html>
<body onload="start()">

     <style>
        /* Basics */
        html, body {
            width: 100%;
            height: 100%;
            font-family: "Helvetica Neue", Helvetica, sans-serif;
            color: #444;
            -webkit-font-smoothing: antialiased;
            background: #f0f0f0;
            //background-image: url("images/wel.jpg");
            background-size: 100% 100%;
        }
        #container {
            position: fixed;
            width: 340px;
            height: 280px;
            top: 40%;
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
        
        
        function reset(){
            
            window.location = "display.jsp";
        }
        
        
        function preventBackspace(e) {
            var evt = e || window.event;
            if (evt) {
                var keyCode = evt.charCode || evt.keyCode;
                if (keyCode === 8) {
                    if (evt.preventDefault) {
                        evt.preventDefault();
                    } else {
                        evt.returnValue = false;
                    }
                }
            }
        }
        
        function start()
        {
        	//alert("start");
        	var str = '<%=pw2%>';
        		var c1= str.charAt(0);
        		 c1+=".PNG";
            var c2="images/";
         	var res = c2.concat(c1);
        	 document.getElementById("pic").src=res;
        	
        }
        
        
        var c=0;
        var flag;
		    flag=0;
        function checkPass1()
        {
        	//alert("check");
            //Store the password field objects into variables ...
            var st = document.getElementById("secondarypassword");
            var str = '<%=pw2%>';
            var pass1=st.value;
            var goodColor = "#66cc66";
            var badColor = "#ff6666";
            var message = document.getElementById('confirmMessage');
  			c=c+1;
  			
            if(pass1.length===1 && c==1)
  		  {
            	if(pass1.charAt(0)===str.charAt(0))
            	{
            	 st.style.backgroundColor = goodColor;
            	 var c1= str.charAt(1);
                 c1+=".PNG";
               var c2="images/";
            	var res = c2.concat(c1);

            	document.getElementById("pic").src=res;
  		 
            	}
            	else
            		{
            		 st.style.backgroundColor = badColor;
            		 message.innerHTML = "Passwords DO NOT Match!";
            		 document.getElementById("secondarypassword").value = "";
            		c=0;
            		}
            }
            
            if(pass1.length===2 && c==2)
            	
  		  {
         
            	if(pass1.charAt(1)==str.charAt(1))
            		{
            		
            		document.getElementById("pic").src="images/prev.PNG"; 
                	document.getElementById("secondarypassword").value = "";
            	    flag=-1;
            		}
  		  
            	else{
            		st.style.backgroundColor = badColor;
           		 message.innerHTML = "Passwords DO NOT Match!";
           		 document.getElementById("secondarypassword").value = "";
           		c=0;
            	}
  		  
  		  }
            
            if (flag==-1 && c==3)
            	{
            	
            
        		if(pass1.substring(0,2)==str.substring(0,2))
        			{
        			
	            	var c1= str.charAt(2);
	                 c1+=".PNG";
	               var c2="images/";
	            	var res = c2.concat(c1)
	                document.getElementById("pic").src=res;
	            	st.style.backgroundColor = goodColor;
        			}

            	else{
            		st.style.backgroundColor = badColor;
          
           		c=c-1;
            	
            	}
            	
            	}
           
	         if(pass1.length===3 && c==4)
  		  {
	        	 if(pass1.charAt(2)==str.charAt(2))
         		{
         		document.getElementById("pic").src="images/prev.PNG"; 
             	document.getElementById("secondarypassword").value = "";
         	    flag=-2;
         		}
		  
         	else{
         		st.style.backgroundColor = badColor;
        		 message.innerHTML = "Passwords DO NOT Match!";
        		 document.getElementById("secondarypassword").value = "";
        		c=0;
         	}
  		  }
          
	         if(flag==-2 && c==5)
	        	 {
	        	 if(pass1.substring(0,3)==str.substring(0,3))
     			{
	            	var c1= str.charAt(3);
	                 c1+=".PNG";
	               var c2="images/";
	            	var res = c2.concat(c1);
	                document.getElementById("pic").src=res;
	                st.style.backgroundColor = goodColor;

     			}
	        	 else{
	            		st.style.backgroundColor = badColor;
	          
	           		c=c-1;
	            	
	            	}
         	
	        	 }
	         
	         
	         
	         
	         if(pass1.length===4 && c==6)
    		  {
	        	 if(pass1.charAt(3)==str.charAt(3))
                    {
	         		document.getElementById("pic").src="images/prev.PNG"; 
	             	document.getElementById("secondarypassword").value = "";
	         	    flag=-3;
	         		}
			  
	         	else{
	         		st.style.backgroundColor = badColor;
	        		 message.innerHTML = "Passwords DO NOT Match!";
	        		 document.getElementById("secondarypassword").value = "";
	        		c=0;
	         	}
    		  }
           
	         
	         if(flag===-3  && c===7)
        	 {
		        	 if(pass1.substring(0,4)==str.substring(0,4))
		 			{
		            	var c1= str.charAt(4)
		                 c1+=".PNG";
		               var c2="images/"
		            	var res = c2.concat(c1)
		                document.getElementById("pic").src=res;
		               st.style.backgroundColor = goodColor;

		 			}
		
		        	 else{
		            		st.style.backgroundColor = badColor;
		          
		           		c=c-1;
		            	
		            	}
     	
        	 }
	         
	         if(pass1.length===5&& c==8)
   		      {
	        	 if(pass1.charAt(4)==str.charAt(4))
	         		{
	         		document.getElementById("pic").src="images/prev.PNG"; 
                                document.getElementById("secondarypassword").value = "";
                                document.getElementById("Register").disabled = false;
                                flag=-4;
	         		}
			  
	         	else{
	         		st.style.backgroundColor = badColor;
	        		 message.innerHTML = "Passwords DO NOT Match!";
	        		 document.getElementById("secondarypassword").value = "";
	        		c=0;
	         	}
   		      }
       
	         
	         if(flag==-4 && c==9)
        	 {
		        	
	        	 if(pass1.substring(0,5)==str.substring(0,5))
		 			{
		            	
		        		 var c1= str.charAt(4)
		                 c1+=".PNG";
		               var c2="images/"
		            	var res = c2.concat(c1)
		                document.getElementById("pic").src="images/success.PNG";
		               st.style.backgroundColor = goodColor;
		               

		 			}
		        	 else{
		            		st.style.backgroundColor = badColor;
		          
		           		c=c-1;
		            	
		            	}
        
        
           } 
        }
	         </script>

    <div class="row">
                <div class="col-md-12">
                    <h2 align="center">uSec - Two Factor Authentication</h2>
		</div>
		<div class="col-md-12">
		<h3 align="center">Registration</h3>
		</div>
    </div>
       

    <div id="container">
    <form action="RegistrationServlet" method="get" id="form1">
        
        <div align="center">
            <img src= alt="Mountain View" style="width:150px;height:150px;" name="pic" id="pic"  >
        </div>
            <span id="confirmMessage1" class="confirmMessage"></span>
            <label for="secondarypassword">Secondary Password:</label>
            <input type="text"  id="secondarypassword" name="secondarypassword" onkeyup="checkPass1(); return false;"  onKeyDown="preventBackspace();" ><br>
            
       <div id="lower">
           
                <input type="submit" id="Register" value="Register" disabled="true">
        </div><!--/ lower-->
 
    </form>

        <input align="center" type="button" value="Reset" onclick="reset()"/>
   </div>
    
</body>
</html>