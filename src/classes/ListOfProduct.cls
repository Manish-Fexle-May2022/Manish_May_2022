public with sharing class ListOfProduct {
    public static void listStates() {

        // Initialize the List of states
        List<String> listofstates = new List<String>();

        // This statement would give null as output in Debug logs
        system.debug('Value of List : ' +listofstates);

        // Add element to the list using add method
        listofstates.add('Uttar Pardesh');
        listofstates.add('Rajasthan');
        listofstates.add('MP');
        listofstates.add('UK');

        // This statement would give Uttar Pardesh, Rajasthan, MP and UK as output in Debug logs
        system.debug('Value of List new States : ' +listofstates);

        // Get the element at the index 0
        String statesAtFirstPosition = listofstates.get(0);

        // This statement would give Uttar Pardesh as output in Debug log
        system.debug('Vaule of List at First Position : ' +statesAtFirstPosition);

        // set the element at 1 position
        listofstates.set(0,'Haryana');

        // This statement would give output in Debug log
        system.debug('Vaule of List with element set at First Position : ' +listofstates[0]);

        // Remove all the elements in List
        listofstates.clear();

        // This statement would give output in Debug log
        system.debug('Value of List'+ listofstates);

        // Sorting List
        List<SelectOption> options = new List<SelectOption>();
        
        options.add(new SelectOption('A','Uttar Pardesh'));
        options.add(new SelectOption('C','Rajasthan'));
        options.add(new SelectOption('A','UK'));
        
        System.debug('Before sorting: ' + options);
        options.sort();
       
        System.debug('After sorting: ' + options);

        // Initialize the List of Integer
        List<Integer>  integerlist= new List<Integer>();
        integerlist.add(234);
        integerlist.add(12);
        integerlist.add(356);

        // Retrieves the element at index 0
        Integer i = integerlist.get(0);
        system.debug(i);

        // Adds the integer 1 to the list at index 0
        integerlist.set(0, 1);


        // Create a list based on an existing one
        List<Integer> integerlist2 = new List<Integer>(integerlist);
        
        // integerlist2 elements are copied from integerlist
        System.debug(integerlist2);

        integerlist2.add(1);
        Integer myNumber = integerlist.get(0);
        system.assertEquals(1, myNumber);
    }
        //**********Collection List of Object using clone method***********
   
    public static List<sObject> accountMethod(){
        Account a = new Account(Name='Acme', BillingCity='New York');

        Account b = new Account();
        Account[] c = new Account[]{a,b};

        Account[] d = c.clone();
        c[0].BillingCity = 'San Francisco';

        system.assertEquals('San Francisco',c[0].BillingCity);
        system.assertEquals('San Francisco',d[0].BillingCity);
        for(Account a1 : d){
            system.debug(a1);
        }
        return d;
    }
}