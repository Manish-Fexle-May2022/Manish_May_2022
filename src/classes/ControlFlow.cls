public with sharing class ControlFlow {
    public static void controlFlow(integer count, integer stop, integer num) {

        do {
            System.debug(count);
            count++;
        } while (count < stop);

        //Print Factorial Number
        integer i = 1; 
        integer fact = 1; 
        do {  
            fact = fact * i;   
            i++;   
        } while( i <= num );  

        system.debug('Factorial of ' + num + ' is: ' + fact);  
        
        // Code for do while loop
        ////it will fetch only 20 records
        List<Account> accountList = [SELECT Id,Name FROM Account LIMIT 20]; 

        integer j = 0;
        do {
        accountList[j].Name = 'This is the '+j;

        // This will print the updated description in debug log
        system.debug('Updated Description'+accountList[j].Name);
        j++; // Increment the counter
        } while (j< 1);   // iterate till 1st record only
    }
		
    //Description :   Control Flow While Loop
    public static void factorial(Integer value)
    {
        Integer count=2, result=2;
        while(count<=value)
        {
             result=result*count;
             count++;        
        }
         System.debug('factorial of given number is: '+result);
    }
	
    //Description :   Control flow using for-each loop	
    public static void methodforeach(){
        List<Account> accList = [SELECT Id,Name From Account LIMIT 20];
        for(Account acc : accList){
            system.debug('##'+acc);
        }

        Map<Id,Contact> contactMap = new Map<Id,Contact>([SELECT Id,Name FROM Contact LIMIT 20]);
        for(Contact con : contactMap.values()){
            system.debug('===>>>'+con);
        }
        for(Id idd : contactMap.keySet()){
            system.debug('####'+idd);
        }

        Set<String> strSet = new Set<String>();
        strSet.add('One');
        strSet.add('Two');
        strSet.add('Three');
        strSet.add('Four');
        strSet.add('Five');
        strSet.add('Six');
        strSet.add('Seven');
        strSet.add('Eight');
        strSet.add('Nine');
        strSet.add('Ten');

        for(String st : strSet){
            system.debug('!!!'+st);
        }
    }
}
