package com.wellness.testcases;

public class Calculations {
	
		public static int multiply(int x, int y) {
			int product=x*y;
			return product;
			
		}
		
		public static int add(int x, int y, int z) {
			int product=x+y+z;
			return product;
			
		}
		
		public static int average(int x, int y, int z) {
			int ave=(x+y+z)/3;
			return ave;
			
		}
		 
		public static int findMax(int arr[]){  
	        int max=0;  
	        for(int i=1;i<arr.length;i++){  
	            if(max<arr[i])  
	                max=arr[i];  
	        }  
	        return max;  
	    }  
	 
		
		
	}



