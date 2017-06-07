package com.wellness.controller;

import java.text.ParseException;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.sql.DataSource;

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
import com.wellness.service.SendMail;
import com.wellness.service.WellnesService;
import com.wellness.wellnessUtils.WellnessUtils;


@Controller
@SessionAttributes("emailAddress")
public class WellnessController {
	
		    public WellnessController() {
				System.out.println("in WellnessController servelet");
			}
		    
		    
		    
		     @Autowired
			private WellnesService wellnesService; 
		     
		     @Autowired
			    DataSource dataSource;
		    
		   
		    SendMail sendMail =new SendMail();
		    WellnessUtils wellnessUtils=new WellnessUtils();
		    
		    @RequestMapping(value = "/jdbcCrudes", method = RequestMethod.GET)
		    public String services(Model model) {
		         model.addAttribute("attribs", wellnesService.jdbcDbConnect("kenn.juma@yahoo.com"));
		              
		        return "jdbcCrudes";
		    }
		    
		    @RequestMapping("email-lookup")
		    public String handlepost(@ModelAttribute("email-lookup") UserLogin userLogin, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    		    	 
			    	 try {
				    		 if(wellnesService.findUser(userLogin.getEmailAddress())== true){
				    			 model.addAttribute("attribs", wellnesService.jdbcDbConnect(userLogin.getEmailAddress()));
					    		//UserLogin userdetail= wellnesService.getUserByEmailId(userLogin.getEmailAddress());
					    		//model.addAttribute("attribs", userdetail);
				    		 }else{
				    			 model.addAttribute("error", "User email does noe exist in the Data base"); 
				    		 }		    		 
					     }
						 catch(EmptyResultDataAccessException e){
							
							 }catch(RuntimeException e) {						
								model.addAttribute("error", "Unexpected error occured");
								e.printStackTrace();
							    
						  }
		    	 
		    	 
		         return "services";
		    	
		    }
		    
		    @RequestMapping("lookUpname")
		    public String lookUpname(@ModelAttribute("lookUpname") UserLogin userLogin, BindingResult bindingResult, ModelMap model){    	
		    	
		    	     try {
		    	    	     UserLogin userdetail= getUserByNane(userLogin.getLname());	
		    	    	     model.addAttribute("attribs", userdetail);
				    		  		 
					     }
						 catch(EmptyResultDataAccessException e){
							 model.addAttribute("error", "User "+userLogin.getLname()+" does noe exist in the Data base"); 
				    		 
							 }catch(RuntimeException e) {						
								model.addAttribute("error", "Unexpected error occured"+e);
								e.printStackTrace();
							    
						  }
		    	 
		    	 
		         return "services";
		    	
		    }
		    
		    
		    @RequestMapping(value = "/logins", method = RequestMethod.GET)
		    public String login(Model model) {
		    	model.addAttribute("loginUser", new UserLogin());
		    	model.addAttribute("msg", "Login to explore the complete features!");
		        return "logins";
		    }
		    
		    
		    
		    @RequestMapping("bio")
		    public String bio(ModelMap model, @RequestParam("id") long id){    	
		    	
		    	try {
		    		UserLogin userdetail= wellnesService.getUserById(id);
		    		model.addAttribute("attribs", userdetail);
    		        model.addAttribute("user", userdetail.getFname());
    		        model.addAttribute("role", userdetail.getRoles());
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();					    
				  }
		    		
		    	return "bio";
		    }
		    
		   
		    
		    @RequestMapping("LookupMembers")
		    public String searchMembers(ModelMap model, @RequestParam("LookupMembers") String names, @RequestParam(value="id",required=false) long id){    	
		    	
		    	try {
		    		long membersId=id;
		    		List<UserLogin> memberList = wellnesService.lookupMembers(names);
		    		if(wellnesService.getUserByName(names).isEmpty()){          
		                model.addAttribute("error",  "There are no matches for this Look-up");
		               }
		    		else		    				
		    			model.addAttribute("success", memberList.size()+ " members found with name " +names);
		    		    model.addAttribute("users", memberList);		    		    
		    		    model.addAttribute("user", wellnesService.getUserById(membersId));
		    		    
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();					    
				  }
		    		
		    	return "members";
		    }
		    
		    @RequestMapping("lookupArtist")
		    public String lookartist(ModelMap model, @RequestParam("lookupArtist") String names){    	
		    	
		    	try {
		    		
		    		List<UserLogin> memberList = wellnesService.getUserByName(names);
		    		if(wellnesService.getUserByName(names).isEmpty()){          
		                model.addAttribute("error",  "There are no matches for this Look-up");
		               }
		    		else		    				
		    			model.addAttribute("success", memberList.size()+ " members found with name " +names);
		    		    model.addAttribute("users", memberList);		    		    
		    		     
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();					    
				  }
		    		
		    	return "services";
		    }
		    
		    @RequestMapping("Lookupcity")
		    public String searchCity(ModelMap model, @RequestParam("Lookupcity") String cityorZip, @RequestParam(value="id",required=false) long id){    	
		    	
		    	
		    	try { 
		    		//List<UserLogin> memberList = wellnesService.getUserByName(cityorZip);
		    		if(lookupCity(cityorZip).isEmpty()){          
		                model.addAttribute("error",  "There are no matches for this Look-up");
		               }
		    		   else{if(!(id==-1)){
		    			    model.addAttribute("users", lookupCity(cityorZip));
			    		    model.addAttribute("user", wellnesService.getUserById(id));
			    		    if(Pattern.matches("^\\d+$", cityorZip)){
			    		    model.addAttribute("success", lookupCity(cityorZip).size()+ " Members found in Postal ZIP  " +cityorZip);
			    		    }else
			    		    	model.addAttribute("success", lookupCity(cityorZip).size()+ " Members found in the city of " +cityorZip);
			    		    return "members";
		    		   }else	    				
		    		   
		    		    model.addAttribute("users", lookupCity(cityorZip));
		    		    model.addAttribute("success", lookupCity(cityorZip).size()+ " Members found in " +cityorZip);
		    		   
		    		}
		    		    
				    } 
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();					    
				  }
		    		
		    	return "services";
		    }
		    
		    
			@SuppressWarnings("rawtypes")
			public List<UserLogin> lookupCity(String cityOrZip) {
				JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource); 
				
		       	final String sql  = "SELECT m.* FROM wellness.users m WHERE m.city like '%"+ cityOrZip +"%'"
		       			+ " UNION "
		       			+ "SELECT m.* FROM wellness.users m WHERE m.zip like '%"+ cityOrZip +"%'";
		       	@SuppressWarnings("unchecked")
		   		List<UserLogin> memberList = jdbcTemplate.query(sql, new BeanPropertyRowMapper( UserLogin.class ));						
		   		return memberList;
		   		 
			}
   
	       
	    
	       @RequestMapping(value = {"index", "/"}, method = RequestMethod.GET)
		    public String index(Model model){ 
		    model.addAttribute("msg", "Hi welcome to wellness club");
		    model.addAttribute("m", "Select Units");
	    	model.addAttribute("wt", "lb/kg");
	    	model.addAttribute("ht", "ft/cm");
		    
		    	return "index";				 
			} 
	       
	       @RequestMapping(value ="bmi",  method = RequestMethod.POST)
	       public String bmi(@RequestParam Map<String,String> requestParams,Model model) throws Exception{
	       	   String w=requestParams.get("w");
	       	   String h=requestParams.get("h");
	       	   String m=requestParams.get("system");    	   
	       	   Integer wt = Integer.valueOf(w);
	       	   Integer ht = Integer.valueOf(h);
	       	
	       		 if(m.equals("metric")){
	   		    //metric system SI units
	   		    	    double bmi = wellnessUtils.getBmi(wt, ht, 10000);
	   	    		   // model.addAttribute("welcome", "You selected "+m+" Height "+ h+ " cm weight " +w+ " kg" );
	   			    	model.addAttribute("bmi", "Your BMI is " +bmi);
	   			    	model.addAttribute("status", "You are " +wellnessUtils.getStatus(bmi));  
	   			    	model.addAttribute("m", m); 
	   			    	model.addAttribute("wt", "kg");
	   			    	model.addAttribute("ht", "cm");
	   			    	model.addAttribute("w", wt);
	   			    	model.addAttribute("h", ht);
	       	     }else {
	       		 // Imperial system US units
	   	    		    if(m.equals("imperial")){
	   	    		    double bmi = wellnessUtils.getBmi(wt, ht, 703);
	   			    	//model.addAttribute("welcome", "You selected " +m+ " Hight "+ h+ " in weight " +w+ " lb");
	   			    	model.addAttribute("bmi", "Your BMI is " +bmi);
	   			    	model.addAttribute("status", " - " +wellnessUtils.getStatus(bmi));
	   			    	model.addAttribute("m", m); 
	   			    	model.addAttribute("wt", "lb");
	   			    	model.addAttribute("ht", "ft");
	   			    	model.addAttribute("w", wt);
	   			    	model.addAttribute("h", ht);
	   	    		    }
	       		   		 
	       	 }
	       	return "index";
	       }
	       
		    @RequestMapping(value = "/about", method = RequestMethod.GET)
		    public String about(Model model) {
		    	
		        return "about";
		    }
		    
		    
		    @RequestMapping(value = "/contact", method = RequestMethod.GET)
		    public String contact(Model model) {
		    	model.addAttribute("sendEmail", new UserLogin());
		    	model.addAttribute("message", "Wellcome to wellness, please drop us an email"); 
		    	
		        return "contact";
		    }
		    
		    @RequestMapping("messageArtist")
		    public String contactartist(@ModelAttribute("messageArtist") Wellness wellness, BindingResult bindingResult, Model model) { 
		    			  
			    			  String validemails = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
			    	          String message="Name: " +wellness.getName()+ "\nEmail: " +wellness.getSubject()+"\n\nMessage: " + wellness.getMsg();
			    	          
			    	          
			   	                try { 
					            	   UserLogin userdetail= wellnesService.getUserById(wellness.getId());
					            	   
					            	   if(!wellness.getSubject().matches(validemails)) {
						    	        	  model.addAttribute("attribs", userdetail);
						                	  model.addAttribute("error", "Invalid email "+ wellness.getSubject()+ " please use format johnsmith@scglobal.com ");		                  
						   	           }else{
					            	   sendMail.sendMails(wellness.getEmailAddress() , wellness.getSubject(), message.toString());					          
					                   model.addAttribute("success", "Thanks you "+wellness.getName()+" an email has been sent to "+ userdetail.getFname());
					                   model.addAttribute("attribs", userdetail);
						   	           }
							        }catch(Exception e) {
							                 model.addAttribute("sendmailfail", "Error sending email  " );
							                 e.printStackTrace();
							        }
			   	                
						
						return "bio";
				    }
		    
		    
		    @RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
		    public String sendMail(@ModelAttribute("sendEmail") Wellness wellness, BindingResult bindingResult, Model model) { 
		    	          
		    	          String validemails = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"; 
		    	          model.addAttribute("em", wellness.getEmailAddress());
		       	          model.addAttribute("sb", wellness.getSubject());              
		                  String message="Subject: " +wellness.getSubject()+"\nMessage: " + wellness.getMsg();
		          
		                  if(!wellness.getEmailAddress().matches(validemails)) {
		                	  model.addAttribute("emailrror", "Invalid email "+ wellness.getEmailAddress()+ " use format johnsmith@scglobal.com ");		                  
		   	               }
		                  
		                  if(wellness.getSubject().isEmpty()) {
		                	  model.addAttribute("sbjrror", "Please enter Emain Subject");		                    
		   		           }  
		                  
		                  if(wellness.getMsg().length() <= 1 || wellness.getMsg().length() > 3000) {
		                	  model.addAttribute("msgerror", "Must be between 10 and 300 characters");		                   
		   		           }
		                  
		                  else
				       
				             try {     
				            	   sendMail.sendMails(wellness.getEmailAddress() , wellness.getSubject(), message.toString());					          
				                   model.addAttribute("success", "Thanks Email has been sent to "+ wellness.getEmailAddress());
				                   model.addAttribute("emailrror", "");  
				                   model.addAttribute("sbjrror", "");		                   
				       	           model.addAttribute("msgerror", "");
				       	           model.addAttribute("em", "");
				       	           model.addAttribute("sb", "");   
				       	           
						        }catch(Exception e) {
						                 model.addAttribute("sendmailfail", "Error sending email  " );
						                 e.printStackTrace();
						        }
						
						return "contact";
				    }
		    
	
		    
		    @SuppressWarnings({ "unchecked", "rawtypes" })			
			public UserLogin getUserByNane(String name){
				String sql = "SELECT * FROM wellness.users WHERE lname = ?";
		     JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		     UserLogin userLogin = (UserLogin) jdbcTemplate.queryForObject(
		     sql, new Object[] { name }, new BeanPropertyRowMapper(UserLogin.class));
		     return userLogin;
			}
		    
		    
		      
		
}


