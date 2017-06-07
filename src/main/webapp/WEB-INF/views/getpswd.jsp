

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    
  </head>
  <body>
	
	
	<form id="getnewpass" method="post"  action="getnewpass">
                    
      <div class="contact-form">
              <div class="container">
              
                     <%-- <div class="col-md-4">
                           <div class="form-group">
                                <label for="emailAddressInput" >Email*</label>									
									    <input type="hidden"  name="id" value="${attribs.id}"/>
										<input type="text" class="form-control"  name="emailAddress" id="emailAddressInput" value="${attribs.emailAddress}" placeholder="Email Address" />
							    </div>                           
                     </div> --%>
              
                     <div class="col-md-3">
                           <div class="form-group">
                               <input type="hidden"  name="id" value="${attribs.id}"/>
							   <input type="hidden"   name="emailAddress" id="emailAddress" value="${attribs.emailAddress}" />
							   
                              <label for="pswd" id='pswd' >Password*</label>                               
                              <input type="password" class="form-control" name="password" id="password" placeholder="Password" />
                           </div>                           
                     </div>
                     
                     <div class="col-md-3">
                           <div class="form-group">
                              <label for="pswdR" id='pswdR' >Reenter password*</label>                               
                              <input type="password" class="form-control" name="passwordConfirm" id="passwordConfirm" placeholder="Re-enter password" />
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
   
  </body>
  
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
</html>
