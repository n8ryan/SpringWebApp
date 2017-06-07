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
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    
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
								<li class="active"><a href="">Update Form</a></li>
								<li class="pull-right"><a href="index">Logout | ${user}</a></li>					
							</ul>
						</div>
					</div>						
				</div>
			</div>	
		
	</header>
	
	<div class="container">
		<div class="col-lg-8 col-lg-offset-3">
			<div>
			
			    <h1 style="color: #008000">Wellness club Data entry</h1>
				
				<h2 class="text-success" >${message} </h2>				
				<h2 class="text-danger" >${error} </h2>
							
			</div>
		</div>

		<div>
		     
		</div>
	</div>
	
	<form id="editUser" method="post"  action="saveUser">
                    
      <div class="contact-form">
              <div class="container">
                                  
                     <div class="col-md-4" >
                           <div class="form-group">
                              <label for="ln" id='eln' >Last Name*</label>
                              <input type="hidden" class="form-control" name="loggedin" value="${id}"/>
                              <input type="hidden" class="form-control" name="id" value="${attribs.id}"/>
                              <input type="hidden" class="form-control" name="roles" value="${attribs.roles}"/>
							  <input type="hidden" class="form-control" name="emailAddress" id="emailAddress"  value="${attribs.emailAddress}"/>							    
                              <input type="hidden" class="form-control" name="password" id="password" value="${attribs.password}"/>
                              <input type=text id="lname" name="lname" class="form-control input-sm" placeholder="Last Name" value="${attribs.lname}"> 
                           </div>
                           
                     </div>
                     <div class="col-md-4">
                           <div class="form-group">
                              <label for="fn" id='efn' >First Name*</label>                              
                              <input type=text id="fname" name="fname" class="form-control input-sm" placeholder="First Name" value="${attribs.fname}"> 
                           </div>
                           
                     </div>
                     
                     <div class="col-md-1">
                           <div class="form-group">
                              <label for="ag" id='eag' >Age*</label>
                              <input type='number' id="age" name="age" class="form-control input-sm" placeholder="Age"  min="21" value="${attribs.age}"> 
                           </div>
                           
                     </div>
                     <div class="col-md-4">
                           <div class="form-group">
                              <label for="ad" id='ead'>Address*</label>
                              <input type=text id="address" name="address" class="form-control input-sm" placeholder="Address" value="${attribs.address}"> 
                           </div>
                           
                     </div>
                     <div class="col-md-4">
                           <div class="form-group">
                              <label for="tl" id='etl'> City</label>
                              <input type=text id="city" name="city" class="form-control input-sm" placeholder="Job Title" value="${attribs.city}"> 
                           </div>
                           <div id='etl'>
                           
                           </div>
                     </div>
                     
                     <div class="col-md-4">
                           <div class="form-group">
                              <label for="tl" id='etl'> State</label>
                              <input type=text id="state" name="state" class="form-control input-sm" placeholder="Job Title" value="${attribs.city}"> 
                           </div>
                           <div id='etl'>
                           
                           </div>
                     </div>
                     
                     <div class="col-md-3">
                           <div class="form-group">
                              <label for="tl" id='etl'> Zip</label>
                              <input type=text id="zip" name="zip" class="form-control input-sm" placeholder="Job Title" value="${attribs.zip}"> 
                           </div>
                           <div id='etl'>
                           
                           </div>
                     </div>
    
                     
                     <div class="col-md-3">
                           <div class="form-group">
                              <label for="tel" id='etel'>Telephone*</label>
                              <input type=text id="tel" name="tel" class="form-control input-sm" placeholder="Telephone" value="${attribs.tel}"> 
                           </div>
                           
                     </div>
                     
                     
                     <div class="col-md-3">
                           <div class="form-group">
                           <label for="subscription" id='subscription'>Subscription Type</label>
                              <select name="subscription" id="subscription" class="form-control input-sm">
                                                  <option value="Life Time Membership">Life Time Membership $400</option>
                                                  <option value="Anual Subscription" >Annual Subscription $100</option>  
                                                  <option value="Monthly Subscription" >Monthly Subscription $35</option>                                                
                                                  <option value="${attribs.subscription}" selected>${attribs.subscription}</option>                                           
                                                 </select>                       
                           </div>                           
                     </div>
                     
                     <div class="col-md-3">
                           <div class="form-group">
                              <label for="cd" id='eag' >Credit Card</label>                               
                              <input type='number' id="card" name="card" class="form-control input-sm" placeholder="Credit/debit card"   min="900000" value="${attribs.card}"> 
                           </div>                           
                     </div>
                     
                     
                     <div class="col-md-12" >
		                           <div class="form-group">		                           
					                   <button type="submit" name="submit" id="submit" class="btn btn-primary" >Submit</button>
					                   <a href="index" class="btn btn-primary" role="button">Cancel</a>
								 		
		                              </div>
                                  </div> 
                                  
                                  
                                  
              </div>
       </div>         
           
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
