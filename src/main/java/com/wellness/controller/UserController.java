package com.wellness.controller;

import java.text.ParseException;
import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.wellness.model.UserLogin;
import com.wellness.model.Wellness;
import com.wellness.service.MailService;
import com.wellness.service.SendMail;
import com.wellness.service.WellnesService;
import com.wellness.wellnessUtils.States;
import com.wellness.wellnessUtils.States.Days;


@Controller
@SessionAttributes("emailAddress")
public class UserController {
			   
		    final static Logger logger = Logger.getLogger(UserController.class);
		    //static final Logger logger = (Logger) LoggerFactory.getLogger(UserController.class);
		    
		    public UserController() {
		    	logger.info("in UserController servelet");
			}
		    
		    
		    @Autowired
	     	private MailService mailServices; 
	       
		    
		    @Autowired
		    DataSource dataSource;
		    
		    SendMail sendMail= new SendMail();
		    
		    SendMail mailService =new SendMail();
		    
		   @Autowired
		   private WellnesService wellnesService; 
	    
		   @RequestMapping(value = "/services", method = RequestMethod.GET)
		    public String service(Model model) {
		              model.addAttribute("message", "Welcome to wellness club ");
		              
		              
		        return "services";
		    }
		   
	       @RequestMapping(value = "/signups", method = RequestMethod.GET)
		    public String signups(Model model) {
		              model.addAttribute("signupMember", new UserLogin());
		              logger.info("#######################signup out : ");
		              
		        return "signups";
		    }
	       
	       
	    
		    @RequestMapping("signupMember")
		    public String signupMember(@ModelAttribute("signupMember") UserLogin userLogin, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	 String msg="Welcome to wellness Login now <a href='http://localhost:8080/wellness/login'>Login </a>";     	
		    	try {
		    		    if(wellnesService.findUser(userLogin.getEmailAddress())== false){
		    		    	if(userLogin.getPassword().equals(userLogin.getPasswordConfirm())){
		    		    		wellnesService.createUser(userLogin);	
		    		    		model.addAttribute("message", "Welcome "+userLogin.getFname()+" Login now <a href='login'>Login </a>");
				    			
		    		    		try{
		    		    			sendMail.sendMails(userLogin.getEmailAddress(), "Welcome to wellness ", msg);
		    		    			model.addAttribute("success", "Confirmation email has been sent to "+ userLogin.getEmailAddress()+ " thanks");				                  
					    			
		    		    		}catch(Exception e){
		    		    			model.addAttribute("error", "Error sending confirmation email to "+ userLogin.getEmailAddress());	
		    		    		}
		    		    		  
		    		    		return "login";
		    		    	}
		    		    	else {		    		    		
				    			model.addAttribute("error", "Password not matching ");			    		
		    		    	}
				    			
		                } else {		                	
		                	model.addAttribute("error", "A user exists with the supplied email "+userLogin.getEmailAddress()+" <a href='forgotpassword'> Forgot Password click here </a>");	
		                	
		               }
		    		
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
						logger.error("Sorry, Unexpected error occured!", e);
					    e.printStackTrace();
					    
				  }
		    		
		         return "signups";
		    	
		    }
		    
		    @RequestMapping(value = "/logout", method = RequestMethod.GET)
		    public String logout(Model model) {
		    	logger.info("someone logg in out : ");
		    	if(logger.isDebugEnabled()){
					logger.debug("logout out : ");	
					}
		    	
		    	model.addAttribute("msg", "You have been logged out!");
		        return "login";
		    }
		    
		    
		    
		    @RequestMapping(value = "/login", method = RequestMethod.GET)
		    public String login(Model model) {
		    	
		    	logger.info("called  log in : ");
		    	
		    	if(logger.isDebugEnabled()){
					logger.debug("This is debug : ");
				}
		    	
		    	logger.debug("someone logg in out : ");
		    	
		    	model.addAttribute("loginMember", new UserLogin());
		    	model.addAttribute("msg", "Login to explore the complete features!");
		        return "login";
		    }
		    
		    @RequestMapping(value = "/loginMember", method = RequestMethod.POST)
		    public String login(@ModelAttribute("loginMember") UserLogin user, ModelMap model) throws ParseException{	    	
		    	
					logger.info("user logged in : " + user.getEmailAddress());
				
		    	try {
		    		logger.info("This is info : " + user.getEmailAddress());
		    		UserLogin userdetail= wellnesService.getUserByEmailId(user.getEmailAddress());
		    		 if(wellnesService.findUser(user.getEmailAddress())== true){
		    			 if(userdetail.getEmailAddress().equals(user.getEmailAddress()) && userdetail.getPassword().equals(user.getPassword()) ){
				    			{
				    				model.addAttribute("success", "Welcome "+ userdetail.getFname()+". This is a secure zone! ");		    		        
				    		        model.addAttribute("attribs", userdetail);
				    		        model.addAttribute("user", userdetail.getFname());
				    		        model.addAttribute("role", userdetail.getRoles());
				    		       
				    		        return "profile";
				    			}
				    		}else{
				    			model.addAttribute("error", "Invalid credentials try again ");	
				    		}	
		    		  }
				    }
					catch(EmptyResultDataAccessException e){
						model.addAttribute("error", "User "+user.getEmailAddress()+" does not exists <a href='signups'>Sign up </a>");					    
					  }catch(RuntimeException e) {						
							model.addAttribute("error", "Unexpected error occured");
							e.printStackTrace();
						    
					  }
		    	
		    	return "login";
		    }
		    
		    @RequestMapping("deleteUser")
		    public String searchStudents(@RequestParam long id, @RequestParam long loggedin, ModelMap model){    	
		    			
		    	try { 
		    		UserLogin userdetail= wellnesService.getUserById(id);
		    		if(userdetail.getRoles().equalsIgnoreCase("super")){
		    			model.addAttribute("error", "cannot delete user with Super role");
		    			model.addAttribute("users", wellnesService.getAllusers());
		    			model.addAttribute("user", wellnesService.getUserById(loggedin).getLname());
		    			model.addAttribute("id", loggedin);
		    			model.addAttribute("role", wellnesService.getUserById(loggedin).getRoles());
			    		}else{
			    		wellnesService.deleteUserById(id);
			            model.addAttribute("success", "User deleted successfully");
			            model.addAttribute("users", wellnesService.getAllusers());
			            model.addAttribute("user", wellnesService.getUserById(loggedin).getLname());
		    			model.addAttribute("id", loggedin);
		    			model.addAttribute("role", wellnesService.getUserById(loggedin).getRoles());
			    		}
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");						
			            model.addAttribute("users", wellnesService.getAllusers());
			            model.addAttribute("user", wellnesService.getUserById(loggedin).getLname());
		    			model.addAttribute("id", loggedin);
		    			model.addAttribute("role", wellnesService.getUserById(loggedin).getRoles());
					    e.printStackTrace();
					    
				  }
		    		
		    	return "admin";
		    }
		    
		    
		    @RequestMapping("editUser")
		    public String editUser(@RequestParam long loggedin, @ModelAttribute UserLogin userLogin, ModelMap model){    	
		    	
		    	try {
		    		if(wellnesService.getUserById(userLogin.getId()).getRoles().equalsIgnoreCase("super")){
		    			model.addAttribute("error", "cannot edit a user with super role");
		    			model.addAttribute("users", wellnesService.getAllusers());
		    			model.addAttribute("user", wellnesService.getUserById(loggedin).getLname());
		    			model.addAttribute("id", loggedin);
		    			model.addAttribute("role", wellnesService.getUserById(loggedin).getRoles());
		    			return "admin";
			    		}else{
		    		    model.addAttribute("attribs", wellnesService.getUserById(userLogin.getId()));	
		    		    model.addAttribute("user", wellnesService.getUserById(loggedin).getLname());
		    			model.addAttribute("id", loggedin);
		    			model.addAttribute("role", wellnesService.getUserById(loggedin).getRoles());
				        }
		    		}
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
						model.addAttribute("attribs", wellnesService.getUserById(userLogin.getId()));	
		    		    model.addAttribute("user", wellnesService.getUserById(loggedin).getLname());
		    			model.addAttribute("id", loggedin);
		    			model.addAttribute("role", wellnesService.getUserById(loggedin).getRoles());
				     
					    e.printStackTrace();
					   
				  }
		    		
		    	return "dataEdit";
		    }
		    
		    @RequestMapping("userEdits")
		    public String userEdits(@RequestParam long id, @ModelAttribute UserLogin userLogin, ModelMap model){    	
		    	
		    	try { 
		    		model.addAttribute("attribs", wellnesService.getUserById(id));
		    		model.addAttribute("user", wellnesService.getUserById(id).getFname());
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					   
				  }
		    		
		    	return "UserUpdateForm";
		    }
		    
		    @RequestMapping("userEdit")
		    public String userEdit(@ModelAttribute("userEdit") UserLogin userLogin, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	try {
				    		wellnesService.updateUserById(userLogin, userLogin.getId());
				    		model.addAttribute("message", "Update Success");
				    		model.addAttribute("attribs", wellnesService.getUserById(userLogin.getId()));
				    		model.addAttribute("user", wellnesService.getUserById(userLogin.getId()).getFname());
				    		model.addAttribute("role", wellnesService.getUserById(userLogin.getId()).getRoles());
				    		
				    		return "profile";
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					   
				  }	
		    	 return "UserUpdateForm";
		    }
		    
		    @RequestMapping("saveUser")
		    public String adminEdit(@ModelAttribute("saveUser") UserLogin userLogin, @RequestParam long loggedin, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	try { 
		       		        wellnesService.updateUserById(userLogin, userLogin.getId());
				    		model.addAttribute("message", "User "+userLogin.getFname()+ " "+ userLogin.getLname()+" Updated");
				    		model.addAttribute("users", wellnesService.getAllusers());

				    		model.addAttribute("user", wellnesService.getUserById(loggedin).getLname());
			    			model.addAttribute("id", loggedin);
			    			model.addAttribute("role", wellnesService.getUserById(loggedin).getRoles());
				    		return "admin";
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					   
				  }	
		    	 return "dataEdit";
		    }
		    
		    @RequestMapping("admin")
		    public String admin(@RequestParam long id, @ModelAttribute UserLogin user, Model model) {
		    	
		    	try { 
		    		UserLogin userdetail= wellnesService.getUserById(id);
		    		
			    	model.addAttribute("users", wellnesService.getAllusers());
					model.addAttribute("role", wellnesService.getUserById(id).getRoles());
					model.addAttribute("user", userdetail.getLname());
					model.addAttribute("id", id);
	            	      
			        } catch(EmptyResultDataAccessException e){
						 model.addAttribute("error", " Access denied "); 
			    		 return "login";
						 }		    	
		    	    catch(Exception e) {
			        	     model.addAttribute("user", user.getLname());
						     model.addAttribute("id", id);
						     model.addAttribute("error", " Access denied ");
			                 e.printStackTrace();
			                 return "login";
			        }
				    	              
		        return "admin";
		    }
		    
		    @RequestMapping(value = "/profile", method = RequestMethod.POST)
		    public String profile(@RequestParam long id, @ModelAttribute UserLogin user, Model model) {
		    	UserLogin userdetail= wellnesService.getUserById(id);
	    		
		    	model.addAttribute("success", "Welcome "+ userdetail.getFname()+". This is a secure zone! ");		    		        
		        model.addAttribute("attribs", userdetail);
		        model.addAttribute("user", userdetail.getFname());
		        model.addAttribute("role", userdetail.getRoles());
		           	              
		        return "profile";
		    }
		    
		    @RequestMapping("assignRole")
		    public String assignrole(@ModelAttribute("assignRole") UserLogin userLogin, @RequestParam long loggedin, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	try {
		    		String role= wellnesService.getUserById(userLogin.getId()).getRoles();
		    		if(role.equalsIgnoreCase("super")){
		    			model.addAttribute("error", "cannot re-assign new roles to a user with a super role");
		    			model.addAttribute("role", wellnesService.getUserById(loggedin).getRoles());
		    			model.addAttribute("users", wellnesService.getAllusers());
		    			model.addAttribute("user", wellnesService.getUserById(loggedin).getLname());
		    			model.addAttribute("id", loggedin);
			    		}else{
		    		wellnesService.updaterole(userLogin, userLogin.getRoles(), userLogin.getId());
		    		model.addAttribute("users", wellnesService.getAllusers());
		    		model.addAttribute("role", wellnesService.getUserById(loggedin).getRoles());
		    		model.addAttribute("user", wellnesService.getUserById(loggedin).getLname());
	    			model.addAttribute("id", loggedin);
		    		model.addAttribute("success", "User "+wellnesService.getUserById(userLogin.getId()).getFname()+" assigned role "+userLogin.getRoles());
			    		}
		    		}
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					   
				  }	
		    	 return "admin";
		    }
		    
		    @RequestMapping(value = "/forgotpassword", method = RequestMethod.GET)
		    public String forgotpass(Model model) {
		    	 return "forgotpassword";
		    }
		    
		    @RequestMapping(value = "/resetpassword", method = RequestMethod.GET)
		    public String resetpass(Model model) {
		    	model.addAttribute("message", "Reset your password"); 
		    	
		        return "resetpassword";
		    }
		    
		    
		    @RequestMapping(value = "/forgotpass", method = RequestMethod.POST)
		    public String forgotpass(@ModelAttribute("forgotpass") Wellness wellness, BindingResult bindingResult, Model model) { 
		    	          
		    	          String validemails = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"; 
		    	          model.addAttribute("em", wellness.getEmailAddress());		       	                     
		                  
		                  if(!wellness.getEmailAddress().matches(validemails)) {
		                	  model.addAttribute("emailrror", "Invalid email "+ wellness.getEmailAddress()+ " use format johnsmith@scglobal.com ");		                  
		   	               }
		                  else
				       
				             try {     
				            	 if(wellnesService.findUser(wellness.getEmailAddress())== true){
				            		 try{
				            			   mailServices.sendpasswordemail(wellness.getEmailAddress());
						                   model.addAttribute("success", "Password reset instuction has been sent to "+ wellness.getEmailAddress());
						                   model.addAttribute("emailrror", "");
						       	           model.addAttribute("em", "");
						       	           
				    		    		}catch(Exception e){
				    		    			model.addAttribute("error", "Error sending email to "+ wellness.getEmailAddress());	
				    		    		}
				            	   
				            	 }else{
				            		 model.addAttribute("success", "user not found "+ wellness.getEmailAddress()); 
				            	 }
						        }catch(Exception e) {
						                 model.addAttribute("sendmailfail", "Error sending email  " );
						                 e.printStackTrace();
						        }
						
						return "login";
				    }
		    
		    
		    @RequestMapping(value = "/getnewpass", method = RequestMethod.POST)
		    public String setpass(@ModelAttribute("getnewpass") UserLogin userLogin, @RequestParam(value="id",required=false) long id, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	try {
		    		UserLogin userdetail= wellnesService.getUserByEmailId(userLogin.getEmailAddress());
		    		if(wellnesService.findUser(userLogin.getEmailAddress())== true){
			    		if(userLogin.getPassword().equals(userLogin.getPasswordConfirm())){	
			    			
			    			wellnesService.passReset(userLogin, userLogin.getPassword(), userLogin.getEmailAddress());
				    		model.addAttribute("success", "password reset success, please keep your password safely.");
				    		model.addAttribute("attribs", userdetail); 
				    		model.addAttribute("user", userdetail.getFname());
		    		        model.addAttribute("role", userdetail.getRoles());		    		       
		    		        
			    			try{
			    			mailService.sendMails(userLogin.getEmailAddress() , "Wellness Password", "Your password was reset contact admin if you did not do it");
			    		  	 
	    		    		}catch(Exception e){
	    		    			if(id<0){
	    		    				model.addAttribute("error", "Error sending email to "+ userdetail.getEmailAddress()+ " Please check your network");	
	    		    		    	return "resetpassword";
				    			}
	    		    			model.addAttribute("error", "Error sending email to "+ userdetail.getEmailAddress()+ " Please check your network");	
	    		    		}
			    		}else{
			    			
			    			if(id<0){
			    				model.addAttribute("error", "Password not matching ");	
			    				return "resetpassword";
			    			}else
			    				
					    		model.addAttribute("attribs", userdetail); 
					    		model.addAttribute("user", userdetail.getFname());
			    		        model.addAttribute("role", userdetail.getRoles());
				    			model.addAttribute("error", "Password not matching ");	
			    		}	
			    		}else{
		    		    	model.addAttribute("error", "No user found, <a href='signups'>Sign up </a>");
		    		    	return "login";
		    		    }

		    		}
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					   
				  }	
		    	return "profile";
		    }
		    
		    @RequestMapping("changeSubscriptionType")
		    public String changeMembershipType(@ModelAttribute("changeSubscriptionType") UserLogin userLogin, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	try {
		    		//long creditcard=wellnesService.getUserById(userLogin.getId()).getCard();
		    		
		    		
		    		wellnesService.updateSubscription(userLogin, userLogin.getSubscription(), userLogin.getId());		    		
		    		model.addAttribute("success", "Hi "+wellnesService.getUserById(userLogin.getId()).getFname()+" Your subscription changed, your credit card on file was proccessed");		    		
			    	model.addAttribute("attribs", wellnesService.getUserById(userLogin.getId()));
			    	
		    	    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					   
				  }	
		    	 return "profile";
		    }
		    
		    @RequestMapping("searchMembers")
		    public String searchMembers(ModelMap model, @RequestParam("searchNames") String names, @RequestParam("id") long id){    	
		    	
		    	try { 
		    		//List<UserLogin> memberList = wellnesService.lookupMembers(names);
		    		if(wellnesService.lookupMembers(names).isEmpty()){          
		                model.addAttribute("error",  "There are no matches for this Look-up");
		                model.addAttribute("role", wellnesService.getUserById(id).getRoles());
			    		model.addAttribute("user", wellnesService.getUserById(id).getLname());
		    			model.addAttribute("id", id);
		               }
		    		else		    				
			    		model.addAttribute("users", wellnesService.lookupMembers(names));
			    		model.addAttribute("role", wellnesService.getUserById(id).getRoles());
			    		model.addAttribute("user", wellnesService.getUserById(id).getLname());
		    			model.addAttribute("id", id);
		    		
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					    
				  }
		    		
		    	return "admin";
		    }
		    
		   
		 
		    @ModelAttribute("states")
		    public List<States> populateStates(){
		        return Arrays.asList(States.values());
		    }
		    
		    @ModelAttribute("days")
		    public Days[] day(){
				return Days.values();		       
		    }
		    
		    
}


