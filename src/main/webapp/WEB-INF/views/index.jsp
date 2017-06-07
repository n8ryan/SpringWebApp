<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    
    <!-- Bootstrap -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/jquery.bxslider.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/isotope.css" media="screen" />		
	<link rel="stylesheet" href="${contextPath}/resources/css/animate.css">
	<link rel="stylesheet" href="${contextPath}/resources/js/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
	<link href="${contextPath}/resources/css/prettyPhoto.css" rel="stylesheet" />
	
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
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
								<li class="active"><a href="index">Home</a></li>
								<li><a href="about">About Us</a></li>																
								<li><a href="contact">Contact Us</a></li>	
								<li><a href="signups">Sign up</a></li>
								<li><a href="login">login</a></li>	
								<li><a href="services">Look-Ups</a></li>							
						        <li>
						        <form class="navbar-form navbar-right" role="search"  action="Lookupcity" method="post">
										    <div class="input-group add-on">										      
										      <input type="text" class="form-control" placeholder="Search City or Zip" name="Lookupcity" id="Lookupcity" SIZE='15'>
										      <input type="hidden" name="id" value="-1">
										      <div class="input-group-btn">
										        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search" title="Lookup members by City or Zip"></i></button>
										      </div>
										    </div>
									 </form>
						        </li>	
							</ul>
						</div>
					</div>						
				</div>
			</div>	
		
	</header>
	<br>
	<div class="slider">
		<div class="img-responsive">
			<ul class="bxslider">				
				<li><img src="${contextPath}/resources/images/slider/gym.jpg" style="width:1000px;height:350px;" alt=""/></li>								
				<li><img src="${contextPath}/resources/images/slider/gym3.jpg" style="width:1000px;height:350px;" alt=""/></li>			
			</ul>
		</div>
		
		
    </div>
    
	<div class="container">	
		<div id="show" class="collapse">
		<form action="bmi" method="post" style="color: #008000">	                                   
                     <div class="col-md-2">
                           <div class="form-group">
                                    <select required name="system" id="system" class="form-control input-sm"> 	 
                                                  <option value="metric">Metric</option>
                                                  <option value="imperial" selected>Imperial</option> 
                                                  <option value="Select Units" selected>${m}</option>                                             
                                                 </select>
                                     <label for="imperial" id="sy">Select System</label><br>
                              <input type="text"  id="w" name="w" value="${w}" class="form-control input-sm" placeholder="Weight" ><label for="wt" id="wt">${wt}</label>
                              <input type="text"  id="h" name="h" value="${h}" class="form-control input-sm" placeholder="height" ><label for="ht" id="ht">${ht}</label>						  
                            <br>
                           <button type="submit" name="submit" id="submit" class="btn btn-primary" >BMI</button>                           
                           <a href="index" class="btn btn-primary"><i class="glyphicon glyphicon-refresh"></i> Refresh</a>
                           
                          </div>
                      </div>                       
                 </form>
           </div>
           
         <div class="text-center">
			<h3 class="text-info">
			<a class="btn btn-primary" href="signups">Sign up  </a>
			<a class="btn btn-primary" href="login">Login  </a>
	        <a type="button" class="btn btn-primary" data-toggle="collapse" data-target="#show">Calculate BMI</a>
			</h3>
			              <h3 style="color: #FF0000">${error}</h3> <h3 style="color: #008000">${success}</h3>  
                                  <h3 style="color: #008000">
                                  ${welcome}
                                  </h3>
                                  <h3 style="color: #008000">    
                                   ${bmi} ${status}                       
                                  </h3>    
			 
		</div>			
                            
    
     </div>
		
 <footer  style="background-color: #DAF7A6; position: fixed; bottom:0;width:100%;" >						
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
  
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   -->  
 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->	
    <script src="${contextPath}/resources/js/jquery-2.1.1.min.js"></script>	
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/wow.min.js"></script>
	<script src="${contextPath}/resources/js/fancybox/jquery.fancybox.pack.js"></script>
	<script src="${contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script src="${contextPath}/resources/js/jquery.bxslider.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.prettyPhoto.js"></script>
	<script src="${contextPath}/resources/js/jquery.isotope.min.js"></script> 
	<script src="${contextPath}/resources/js/functions.js"></script>
	<script>
	wow = new WOW(
	 {
	
		}	) 
		.init();
	</script>    
  	
</html>



