<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.NumberFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.io.*,java.util.*" %>
<%java.text.DateFormat dft = new java.text.SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a "); %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <script>
    window.history.forward();
    </script>
       
  </head>
  <body>
	<header style="background-color: #DAF7A6;">		
			<div class="navigation">
				<div class="container">					
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse.collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>						
					</div>
					
					<div class="navbar-collapse collapse">							
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li ><a href="index">Home</a></li>
								<li><a href="about">About Us</a></li>																
								<li><a href="contact">Contact Us</a></li>	
								<li><a href="signups">Sign up</a></li>
								<li><a href="services">Look-Ups</a></li>
								<li class="active"><a href="login">login</a></li>				
							</ul>
						</div>
					</div>						
				</div>
			</div>				
	</header>
	
	<div class="container">
		 
			<div>
				<h1 style="color: #008000">Welcome to wellness club</h1>
				<h3 style="color: #008000">${msg} </h3>
				<h2 style="color: #008000">${message}</h2>
				<h2 style="color: #008000">${success} </h2>
				<h2 style="color: #FF0000">${error} </h2>
				
			</div>
		<div></div>
	</div>
   
	<div class="container">	
		
		<div class="well">
			 <div class="row">
					<div class="col-lg-6">
						<form id="myForm" action="loginMember" method="post" class="bs-example form-horizontal">
							<fieldset>
								<legend>wellness club login </legend><br>								
								
								<div class="form-group">
									<label for="userNameInput" class="col-lg-3 control-label">Email</label>
									<div class="col-lg-9">
										<input type="text" class="form-control" name="emailAddress" id="emailAddress" placeholder="User Name" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="passwordInput" class="col-lg-3 control-label">Password</label>
									<div class="col-lg-9">
										<input type="password" class="form-control" name="password" id="password" placeholder="Password" />
									</div>
								</div>
								

							<div class="col-lg-9 col-lg-offset-3">									
									<button class="btn btn-primary">Login</button>
									<a href="index" class="btn btn-primary" role="button">Cancel</a>
									<a href="forgotpassword" class="btn btn-primary" role="button">Forgot Password</a>
								</div>	
							</fieldset>
						</form>
					</div>
				</div>
				
					
			</div>
			
		</div>		
	<footer  style="background-color: #ff6600; position: fixed; bottom:0;width:100%;" >						
				<div class="col-md-5 col-md-offset-5">
				<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li ><a href="index">Home</a></li>
								<li><a href="about">About Us</a></li>																
								<li><a href="contact">Contact Us</a></li>	
								<li><a href="signups">Sign up</a></li>
								<li><a href="login">login</a></li>	
								<li><a href="services">Look-Ups</a></li>							
						        
							</ul>
							
						</div>
						</div>
		
	</footer>
  </body>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
</html>
