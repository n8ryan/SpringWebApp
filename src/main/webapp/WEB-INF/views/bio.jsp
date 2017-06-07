<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.NumberFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.io.*,java.util.*" %>
<%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <!-- <script>
    window.history.forward();
    </script> 
     -->
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
								<li class="active">
								       
								<a href="#">Bio</a></li>
								<li><a class="btn btn-link" id="profilelink" onclick="document.forms['profile'].submit()">Profile</a>
					            </li>		
								
								<li role="presentation" class="pull-right">
									<form class="navbar-form navbar-right" role="search"  action="LookupMembers" method="post">
										    <div class="input-group add-on">
										      <input type="hidden" name="id" value="${attribs.id}"/>
										      <input type="text" class="form-control" placeholder="Find Members by Name" name="LookupMembers" id="LookupMembers" SIZE='20'>
										      <div class="input-group-btn">
										        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
										      </div>
										    </div>
									 </form>									
						        </li>
						        
						        <li class="pull-right"><a href="logout" id="logout">${attribs.fname} | Logout</a></li>
						        
																			  						
							</ul>
						</div>
					</div>						
				</div>
			</div>				
	</header>
	
	<div class="container">
	
	
	<form id="resetpassword" method="post" action="admin">
	<input type="hidden" name="id" value="${attribs.id}">
	</form>
	
	<form id="admin" method="post" action="admin">
	<input type="hidden" name="id" value="${attribs.id}">
	</form>
	
	<form id="userEdits" method="post" action="userEdits">
	<input type="hidden" name="id" value="${attribs.id}">
	</form>
		
			<div>
				<h1 style="color: #008000" class="text-center">Bio for ${attribs.fname}				
				</h1>
				
				<p style="color: #008000">${msg} </p>
				<h2 style="color: #008000">${message}</h2>
				<h2 style="color: #008000">${success} </h2>
				<h2 style="color: #FF0000">${error} </h2>
				<h2 style="color: #008000">${email} </h2>
				<h2 style="color: #008000">${myname} </h2>
				
				                 			
				
			</div>
			
			
		<div class="row">
		<div class="col-md-6">
		<table class="table table-hover table-bordered" > 
						<tr style="background-color: #bce8f1;">
                    	 	<td>Artist</td>
						     <td>
						    
						     <span class="fa fa-calendar" style="font-size:18px;color:green; padding-top: 2px;">
					         Details <%= df.format(new java.util.Date()) %>
					         </span>
						     
						      </td>
                    	 </tr>
                    	 <tr>
                    	    <td>Name </td> <td><span style="color:red" class="glyphicon glyphicon-user"></span> <c:out value="${attribs.fname}"/> <c:out value="${attribs.lname}"/></td>
                    	 </tr>                    	 
                    	 <tr>
                    	    <td>Contact Info</td> <td><span style="color:red" class="fa fa-phone fa"></span> <c:out value="${attribs.tel}"/>  <span style="color:red" class="fa fa-envelope fa"></span> <c:out value="${attribs.emailAddress}"/></td>
                    	 </tr>
                    	 
                    	 <tr>
                    	    <td>Address </td> <td><span style="color:red" class="glyphicon glyphicon-home"></span> <c:out value="${attribs.address}"/> <c:out value="${attribs.city}"/> <c:out value="${attribs.state}"/> <c:out value="${attribs.zip}"/></td>
                    	 </tr>
                    	 <tr>
                    	    <td>Web site </td> <td><span style="color:green" class="glyphicon glyphicon-globe"></span> <a href="${attribs.website}"><c:out value="${attribs.website}"/> </a> </td>
                    	 </tr>
    		  </table>
    		  </div>
    		  <div class="col-md-6">
    		  <h3>My Bio</h3>
    		   <p>${attribs.background}</p>
    		   <p>Visit my web site <a href="${attribs.website}">http://www.missjillscott.com/</a></p>
    		  </div>
		</div>
		
		<div class="row">
		<form id="msgArtist" method="post" action="messageArtist">			
								
			<div class="col-md-4">
				<div class="form-group">
				    <input type="hidden" name="id" value="${attribs.id}"/>
					<input type="hidden" class="form-control"  value="${attribs.emailAddress}" id="emailAddress" name="emailAddress" placeholder="email Address">
					<input type="text" class="form-control"  id="name" name="name" placeholder="Name">
					
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<input type="text" class="form-control" id="subject" name="subject" placeholder="Email">			    	
				</div>
			</div>
		
			<div class="col-lg-8">				
				<textarea class="form-control" id="msg" name="msg"  rows="5" placeholder="message" required></textarea>
				<br>
				<div class="form-group">
					<button type="submit" name="submit" class="btn btn-primary" >Submit Message</button>					
				</div>
			</div>
				
	
</form>	
</div>		
		
		
		
	</div>
	<br>
	<div id="show" class="collapse">
	<%@include file="getpswd.jsp" %>
	</div>
	
	<form id="profile" method="post" action="profile">
	<input type="hidden" name="id" value="${attribs.id}">
	</form>
	
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
