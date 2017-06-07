
package com.wellness.testcases;
import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
//import org.junit.Ignore;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.testng.annotations.Test;

import com.wellness.service.SendMail;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {AppConfig.class})
public class WellnessTest {
	
	SendMail mailService =new SendMail();
	
	@BeforeClass 
	public void method(){
		System.out.println("In test WellnessTest class" );
	}

	
	/*@Test
	@Ignore("Why disabled")
    public void testSendemail() throws Exception {
		  System.out.println("sending mailtest " );
		  try{ 	           
			  mailService.sendMails("kenn.juma@yahoo.com" , "junit test", "This is Junit test for sending email");			  				   
	        }catch(Exception e) {
	        	throw new Exception("test fail");	
	        }
    	
    }*/
    
    
    @Test
    public void multiplicationOfZeroIntegersShouldReturnZero() {
		System.out.printf("%n[START] Thread Id : %s is started!", Thread.currentThread().getId());
            // assert statements
			 System.out.println("test multiplication 5 and 10	=" +Calculations.multiply(10, 5));
	         assertEquals("10 x 5 must be 50", 50, Calculations.multiply(10, 5));
		     System.out.println("test multiply by Zero = 0");
             assertEquals(0,10*0);
             
             
    }
	
	@Test
   public void addIntegerSets() {			
			System.out.printf("%n[START] Thread Id : %s is started!", Thread.currentThread().getId());  			
			assertEquals(8,Calculations.add(1,3,4));
           System.out.println("test sum of 1,3,4 = "+Calculations.add(1,3,4));
           
          
   }
	
	@Test
   public void average() {
			System.out.printf("%n[START] Thread Id : %s is started!", Thread.currentThread().getId()); 
			System.out.println("test average of 1,3,4 = "+Calculations.average(1,3,4));
			assertEquals(2,Calculations.average(1,3,4));
   }
	
	@Test
   public void findingMaxOIntegerSet() {
		System.out.printf("%n[START] Thread Id : %s is started!", Thread.currentThread().getId());
		System.out.println("test Max of 1,3,4,2 =  "+Calculations.findMax(new int[]{1,3,4,2}));   
       assertEquals(4,Calculations.findMax(new int[]{1,3,4,2}));          
   }

    
   
}