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
							    <li class="active"><a href="#">Look-Ups</a></li>
								<li ><a href="index">Home</a></li>
								<li><a href="about">About Us</a></li>																
								<li><a href="contact">Contact Us</a></li>	
								<li><a href="signups">Sign up</a></li>
								<li><a href="login">login</a></li>
								<li role="presentation" class="small">
									<form class="navbar-form navbar-right" role="search"  action="lookupArtist" method="post">
										    <div class="input-group add-on">										      
										      <input type="text" class="form-control" placeholder="Search Members" name="lookupArtist" id="lookupArtist" SIZE='13'>
										      <div class="input-group-btn">
										        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
										      </div>
										    </div>
									 </form>									
						        </li>								
															
						        <li class="pull-right">
						        <form class="navbar-form navbar-right" role="search"  action="Lookupcity" method="post">
										    <div class="input-group add-on">										      
										      <input type="text" class="form-control" placeholder="Find Members By City or Zip" name="Lookupcity" id="Lookupcity" SIZE='22'>
										      <input type="hidden" name="id" value="-1">
										      <div class="input-group-btn">
										        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search" title="Lookup Members by City or Zip"></i></button>
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
	<div class="container">	
                                  
                                  <div class="text-center">
                                  <h3 class="text-success" style="color: #008000"> 
		                              
                                   ${message} 
                                   
                                   ${fn} 
                                   ${ln} 
                                   ${em}  
                                   
                                   </h3>  
                                   <h3 class="text-danger" >    
                                   ${error}                                   
                                   </h3>  
                                   </div>
                                  
                                   
  <div class="container">	                                 
    <form class="col-md-4" id="email-lookup" method="post"  action="email-lookup">                    
      <div class="contact-form">
              <div class="container">                                
                    
                     <div class="col-md-3">
                           <div class="form-group">
                                <label for="emailAddressInput" >Email Look-Up*</label>									
									    <input type="hidden" name="roles" value="user"/>
										<input type="text" class="form-control" name="emailAddress" id="emailAddressInput" value="${attribs.emailAddress}" placeholder="Email Address" required/>
							    </div>                           
                     </div>
                     
                     <div class="col-md-12" >
		                             <div class="form-group">		                           
					                   <button type="submit" name="submit" id="submit" class="btn btn-primary" >Submit</button> 		                              
		                             </div>
                                  </div>
                </div>
       </div>         
           
        </form>
        
    <form class="col-md-4" id="lookupname" method="post"  action="lookUpname">                    
      <div class="contact-form">
              <div class="container">                                  
                     <div class="col-md-3" >
                           <div class="form-group">
                              <label for="ln" id='eln' >Name Look-up*</label>
                               <input type=text id="lname" name="lname" value="${attribs.lname}" class="form-control input-sm" placeholder="Enter Name" required> 
                           </div>                           
                     </div>                       
                          <div class="col-md-12" >
		                             <div class="form-group">		                           
					                   <button type="submit" name="submit" id="submit" class="btn btn-primary" >Submit</button> 
		                               
		                             </div>
                                  </div> 
              </div>
          </div>
       </form>
    </div>       
        
        <div class="container">
        
        				    	
          <div class="col-md-8" >
             <c:if test="${not empty attribs}">       
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
                    	 	<td>User Email  </td><td><c:out value="${attribs.emailAddress}"/></td>
                    	 </tr>                     	 
                    	 <tr>
                    	    <td>Telephone #</td> <td>${attribs.tel}</td>
                    	 </tr>  
                    	 <tr>
                    	    <td>Address</td> <td>${attribs.address}</td>
                    	 </tr> 
                    	 <tr>
                    	    <td>Subscription</td> <td>${attribs.subscription} </td>
                    	 </tr>   
                    	 <tr>
                    	    <td>Role</td> <td>${attribs.roles} User</td>
                    	 </tr>                    	 
                   </table> 
                    <a class="btn btn-primary" href="services"> <span class="glyphicon glyphicon-refresh"> New Look-Up</span></a>		                           
                                 
                   </c:if>
                   </div>
                   </div>
                   
                   
                   <div class="panel-body">
		
		<c:if test="${not empty users}">
		<table class="table table-hover table-bordered">
                    <thead style="background-color: #ff6600;">
                    <tr > 
                        
                        <th>Name</th>
                        <th>Email</th>                        
                        <th>Address</th>                                               
                        <th>Web site</th>
						                  	
                    </tr>
                    </thead>
                    <tbody  >
                     <c:forEach items="${users}" var="item">
                        <tr class="text-success">
							<th><c:out value="${item.fname}"/> <c:out value="${item.lname}"/></th>
							<th><c:out value="${item.emailAddress}"/></th> 							 
							<th><c:out value="${item.address}"/>, <c:out value="${item.city}"/> <c:out value="${item.state}"/> <c:out value="${item.zip}"/></th>
							<th><c:out value="${item.website}"/></th>				                	
                           </tr>
                      </c:forEach>
                    </tbody>
                </table>
                </c:if>
		  		    
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
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    
 
</html>



