

function oilchangevalidate(e) {				
			// Regex
			var alpha = /^[\w ]+$/;
			var number = new RegExp(/^[0-9]+$/);
			var Specialchar = /^[ A-Za-z0-9_@./#&+-]*$/;
		
			// oils change
			var fullSynthetic = $('#fullSynthetic').val();
			var syntheticBlend = $('#syntheticBlend').val();
			var highMileage = $('#highMileage').val();
			var conventional = $('#conventional').val();
						
			if(!number.test(regular)) {
		        //alert('Please enter numeric characters only for full Synthetic');
				$('#er1').css('color', '#FF0000');
           	    $("#er1").html('Please enter numeric characters only');           	  
                document.getElementById('regular').value = '';
		        $('#fullSynthetic').focus();
		        return false;		       
		    }
			
			
			if(!number.test(fullSynthetic)) {
		        //alert('Please enter numeric characters only for full Synthetic');
				$('#err1').css('color', '#FF0000');
           	    $("#err1").html('Please enter numeric characters only for Full Synthetic');           	  
                document.getElementById('fullSynthetic').value = '';
		        $('#fullSynthetic').focus();
		        return false;		       
		    }
			
			if(number.test(fullSynthetic)) {		       
				$('#error').css('color', '#008000');
           	    $("#error").html('Correct entry thanks');                
		        $('#fullSynthetic').focus();		       		       
		    }
			
			if(!number.test(syntheticBlend)) {
				$('#err2').css('color', '#FF0000');
           	    $("#err2").html('Please enter numeric characters only for Synthetic Blend');
		        //alert('Please enter numeric characters only for full Synthetic Blend');
		        $('#syntheticBlend').focus();
		        return false;
		    }
		    
			
			if(!number.test(highMileage)) {
				$('#err3').css('color', '#FF0000');
           	    $("#err3").html('Please enter numeric characters only for High Mileage');		       
		        //alert('Please enter numeric characters only for full High Mileage');
		        $('#highMileage').focus();
		        return false;
		    }
		    

			if(!number.test(conventional)) {
				$('#err4').css('color', '#FF0000');
           	    $("#err4").html('Please enter numeric characters only for Conventional');  
		        //alert('Please enter numeric characters only for full Conventional');
		        $('#conventional').focus();
		        return false;
		    }
						
		    return true;
		};
		
		function gasvalidation(e) {				
			// Regex
			var alpha = /^[\w ]+$/;
			var number = /^[0-9]+$/;
			var Specialchar = /^[ A-Za-z0-9_@./#&+-]*$/;
		
			// gas
			
			var supers = $('#supers').val();
			var regular = $('#regular').val();
			var premium = $('#premium').val();
			var diesel = $('#diesel').val();
			
					
			if(!number.test(regular)) {
				$('#err1').css('color', '#FF0000');
           	    $("#err1").html('Please enter numeric characters only');
				//alert('Please enter numeric characters only');
		        $('#regular').focus();
		        return false;
		    }
			
			if(number.test(regular)) {
				$('#err1').css('color', '#008000');
           	    $("#err1").html('Please enter numeric characters only');
				//alert('Please enter numeric characters only');
		        $('#regular').focus();		       
		    }
		    
			if(!number.test(supers)) {
		       
				$('#err2').css('color', '#FF0000');
				//alert('Please enter numeric characters only');
           	    $("#err2").html('Please enter numeric characters only for supers');           	  
                document.getElementById('supers').value = '';
		        $('#supers').focus();
		        return false;		       
		    }
			
			if(number.test(supers)) {		       
				$('#err2').css('color', '#008000');
           	    $("#err2").html('Correct entry thanks');           	  
		        $('#supers').focus();		       		       
		    }
			
			
			if(!number.test(premium)) {
				$('#err3').css('color', '#FF0000');
				 //alert('Please enter numeric characters only');
           	    $("#err3").html('Please enter numeric characters only');	
		        $('#premium').focus();
		        return false;
		    }
		    

			if(!number.test(diesel)) {
				$('#err4').css('color', '#FF0000');
           	    $("#err4").html('Please enter numeric characters only');  
		        //alert('Please enter numeric characters only for full diesel');
		        $('#diesel').focus();
		        return false;
		    }
			
		    
		    return true;
		};	
		
		

