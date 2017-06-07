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
	<header>		
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
								<li class="active"><a href="#">Profile</a></li>	
								<li>
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
						        <c:if test="${fn:containsIgnoreCase(role, 'super') || fn:containsIgnoreCase(role, 'admin')}">
						        <li><a  id="adminlink" onclick="document.forms['admin'].submit()">Administrator </a></li>
						        </c:if>
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
				<h1 style="color: #008000">Welcome to the club 				
				</h1>
				<form class="col-md-4 pull-right" action="Lookupcity" method="post">
										    <div class="input-group add-on">										      
										      <input type="text" class="form-control" placeholder="Find members by City (Enter City or Zip)" name="Lookupcity" id="Lookupcity" SIZE='35'>
										      <input type="hidden" name="id" value="${attribs.id}">
										      <div class="input-group-btn">
										        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search" title="Enter City or Zip"></i></button>
										      </div>
										    </div>
									 </form>
				<p style="color: #008000">${msg} </p>
				<h2 style="color: #008000">${message}</h2>
				<h2 style="color: #008000">${success} </h2>
				<h2 style="color: #FF0000">${error} </h2>
				<h2 style="color: #008000">${email} </h2>
				<h2 style="color: #008000">${myname} </h2>
				
				
				<a class="btn btn-default " title="What is my name" href="getMyname?id=<c:out value='${attribs.id}'/>">What is my Name</a>                     
                                 			
				
			</div>
			
			
		<div>
		
		<table class="table table-hover table-bordered"> 
						<tr style="background-color: #bce8f1;">
                    	 	<td>
                    	 	
					           User							
						  
						     </td>
						     <td>
						    
						     <span class="fa fa-calendar" style="font-size:18px;color:green; padding-top: 2px;">
					         Details <%= df.format(new java.util.Date()) %>
					         </span>
						     
						      </td>
                    	 </tr>
                    	 <tr>
                    	    <td>Name </td> <td><c:out value="${attribs.fname}"/> <c:out value="${attribs.lname}"/></td>
                    	 </tr>                    	 
                    	 <tr>
                    	    <td>Telephone</td> <td><c:out value="${attribs.tel}"/></td>
                    	 </tr>
                    	 <tr>
                    	 	<td>User Email  </td><td><c:out value="${attribs.emailAddress}"/></td>
                    	 </tr>                   	 
                    	 <tr>
                    	    <td>
                    	    Membership Type 
                    	    </td> 
	                    	    <td>
	                    	           <form class="col-md-6" action="changeSubscriptionType" method="post">
										    <div class="input-group add-on">
										      <input type="hidden" name="id" value="${attribs.id}"/>
										      <select name="subscription" id="subscription" class="form-control input">
										      	  <option value="Life Time Membership">Life Time Membership $400</option>
                                                  <option value="Anual Subscription" >Annual Subscription $100</option>  
                                                  <option value="Monthly Subscription" >Monthly Subscription $35</option>                                                                                               
                                                  <option value="" selected>${attribs.subscription}</option>                                           
                                             </select> 
										      <div class="input-group-btn">
										         <button class="btn btn-success" type="submit"  title="assign roles">Change Subscription</button>
										      </div>
										    </div>
									 </form>		
							   		
                    	    </td>
                    	 </tr> 
                    	 <tr>
                    	    <td>Address </td> <td><c:out value="${attribs.address}"/> <c:out value="${attribs.city}"/> <c:out value="${attribs.zip}"/></td>
                    	 </tr>
                    	
    		  </table>
    		  
		</div>
	</div>
	<br>
	
  </body>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 	 
 	 
	
</html>
