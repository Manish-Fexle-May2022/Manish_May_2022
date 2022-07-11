public with sharing class AddingAndRetrievingDataWithDML {
    public static void addingAndRetrievingData() {

        //Use Try and Catch Method
        try {
        //Query existing account   
        Account a = [SELECT ID,Name,Industry FROM Account WHERE Name='Account Example' LIMIT 1];
        system.debug('Account Name before update: ' + a.Name);
        system.debug('Account Industry before update: ' + a.Industry);

        a.Name = 'Account of the Day';
        a.Industry = 'Technology';

        update a;
        system.debug(a);
        }
        catch(DmlException e) {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
}