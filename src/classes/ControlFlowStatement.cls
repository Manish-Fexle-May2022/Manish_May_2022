public with sharing class ControlFlowStatement {
    //Description :   Control Flow Statement Using Constuctor find Leap Year
    public  ControlFlowStatement(integer year ){
	integer reminder1 = math.mod(year,4);
        integer reminder2 = math.mod(year,100);
        integer reminder3 = math.mod(year,400);
        if(((reminder1 ==0) && ( reminder2 !=0)) || (reminder3 ==0)){  
            system.debug('LEAP YEAR');  
        }  
        else{  
            system.debug('COMMON YEAR');  
        }  
    }
    //  Description :   Control Flow Statement Using Method Calculate the Bill 
	
    public static Double electricitybill(integer units){        
    	// variable to calculate electricity bill to pay  
     	double billToPay = 0;  
        // check whether units are less than 100  
        if(units < 100){  
            billToPay = units * 1.20;  
        }else if(units < 300){           // check whether the units are less than 300 
            billToPay = 100 * 1.20 + (units - 100) * 2;  
        }else if(units > 300){     // check whether the units are greater than 300    
            billToPay = 100 * 1.20 + 200 * 2 + (units - 300) * 3;  
        }  
        system.debug('The electricity bill for ' +units+ ' is : ' + billToPay);  
        return billtopay; 
    }
    //************ For Loop*************
    //This method Print Table Of Number 2
    public static void forLoop(){
        for (Integer a=1; a<=10; a++) {
            System.debug(+a*2);
    	}
    }
}
