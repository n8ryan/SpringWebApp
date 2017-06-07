package com.wellness.wellnessUtils;

public class WellnessUtils {

	   int z;
	   double bmi;
	       
	   void getMessage(){
           System.out.println("------------------------------------------");
           System.out.println("BMI Evaluation criteria");           
           System.out.println("------------------------------------------");
	    } 
	   
	    public double getBmi(double w, double h,double c) {
	    	   double bmi = w / Math.pow(h, 2) * c;           
	           return Math.round(bmi);  
	    }
	    
	    public String getStatus(double bmi) {
	 	    String status ="";
		    if (bmi < 18.5) {
	    	status= "underweight";
	           } else if (bmi < 25) {
	        	   status= "Normal";          
	           } else if (bmi < 30) {
	        	   status= "Overweight";          
	           } else {
	        	   status= "Obese";       
	           }
		return status;
          
    }
	      
	      
	
	   
	}

 