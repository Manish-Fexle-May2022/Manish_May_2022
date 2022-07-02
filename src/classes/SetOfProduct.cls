public with sharing class SetOfProduct {
    public static void  setProduct() {
        Set<String> productset = new Set<String>{'Phenol', 'Benzene', 'H2SO4'};
        system.debug('Value of ProductSet : ' +productset);

        // Adds an element to the set
        productset.add('HCL');
        system.debug('Set with New Value : ' +productset);

        // Removes an element from set
        productset.remove('HCL');
        system.debug('Set with removed value : ' +productset);

        // Check whether set contains the particular element or not and returns true or false
        productset.contains('HCL');
        system.debug('Value of Set with all values : ' +productset);
    
        // Initialize the Sets
        Set<Integer> setofinteger = new Set<Integer>();
        setofinteger.add(45);
        setofinteger.add(55);
        
        // Create a list based on a set
        List<Integer> integerlist = new List<Integer>(setofinteger);
        
        // integerlist elements are copied from setofinteger
        System.debug(integerlist);
        
        // Initialize the Sets
        Set<integer> myset = new Set<integer>{11, 234, 343};

        List<integer> mylist = new List<integer>{11, 343};
        
        Boolean result = myset.retainAll(mylist);
        System.assertEquals(true, result);

        system.debug(result);

        // Initialize the Sets
        Set<Decimal> decimal1 = new Set<Decimal>();
        
        decimal1.add(23.09);
        decimal1.add(45.89);
        decimal1.add(24.00);

        Set<Decimal> decimal2 = new Set<Decimal>(decimal1); 

        system.debug(decimal2);

        Set<Decimal> decimal3 = new Set<Decimal>{23.09,24.00};
        
        Boolean result2 = decimal2.retainAll(decimal3);
        System.assertEquals(true, result);

        system.debug(result2);
        
        //Define the Set of Integer
        Set<Integer> mynumber = new Set<Integer>{11, 12};
        Set<Integer> snumber = new Set<Integer>{13};
        Set<Integer> rnumber = new Set<Integer>{11, 12, 13};

        Boolean result3, result4;
        
        result3 = mynumber.addAll(snumber);
        system.assertEquals(true, result3);
        system.debug(result3);

        result4 = mynumber.containsAll(rnumber);
        System.assertEquals(true, result4);
        system.debug(result4);
    }
}