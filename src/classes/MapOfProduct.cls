public with sharing class MapOfProduct {
    public MapOfProduct() {
         
        // Difine and Initialize the Map
        Map<string, string> productCodeToproductName = new Map<string, string>
        {'1000'=>'HCL', '1001'=>'H2SO4'};

        // This statement would give as output as key value pair in Debug log
        system.debug('value of ProductCodeToProductName'+productCodeToproductName);
        
        // Define a new map
        Map<string, string> p = new Map<string, string>();

        // Insert a new key-value pair 
        p.put('1002', 'Acetone');
        p.put('1003', 'Ketone');

        // Assert that the map contains a specified key and respective value
        system.assert(p.containsKey('1002'));
        system.debug('If output is true then Map contains the key and output is:'
        + p.containsKey('1002'));

        // Retrieves a value, given a particular key
        String value1 = p.get('1002');
        system.debug('Value at the Specified key using get function: '+value1);

        // Return a set that contains all of the keys in the map
        Set<String> setOfKeys = p.keySet();
        system.debug('Value of Set with Keys '+setOfKeys);

        //Define and Initialize the Map
        Map<Integer, String> mymap = new Map<Integer, String>();
        
        // Insert a new key-value pair in the map
        mymap.put(1, 'First entry');                 
        mymap.put(2, 'Second entry'); 
        
        // Assert that the map contains a key
        System.assert(mymap.containsKey(1));  
        
        // Retrieve a value, given a particular key
        String value2 = mymap.get(2);               
        System.assertEquals('Second entry', value2);
        
        // Return a set that contains all of the keys in the map
        Set<Integer> s = mymap.keySet();
        system.debug('Value of Set with Keys '+s);
    }
      //Collection Map of sObject************* 
   
    public static Map<ID, sObject> accountMethod1(){
        List<Account> listofsObject = [select Id,Name from Account];
        for(Account a :listofsObject){
        	system.debug(a);
        }

        Map<Id, Account> mapofsObject = new Map<Id, Account>(listofsObject);
        for(Account a :mapofsObject.values()){
        	system.debug(a);
        }
        return mapofsObject;
    }
        // Collection Map of Object deep clone*************
    public static Map<Integer, Object> accountMethod2(){
        Account a = new Account(Name='Acme', BillingCity='New York');

        Map<Integer, Account> map1 = new Map<Integer, Account> {};
        map1.put(1, a);

        Map<Integer, Account> map2 = map1.deepclone();
        map1.get(1).BillingCity = 'San Francisco';

        // Update the first entry of map1
        System.assertEquals('San Francisco',map1.get(1).BillingCity);

        // Verify that the BillingCity is updated in map1 but not in map2
        System.assertEquals('New York',map2.get(1).BillingCity);
        
        for(Account a1 : map2.values()){
            system.debug(a1);
        }
        return map2; 
    }
}