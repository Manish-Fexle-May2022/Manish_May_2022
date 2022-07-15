public with sharing class UseOfExternalID {
    //Inserted parent and child record in one statement
    public static void InsertParentChild() {
        Date dt = Date.today();
        dt = dt.addDays(7);
        Opportunity newOpportunity = new Opportunity(
            Name='OpportunityWithAccountInsert',
            StageName='Prospecting',
            CloseDate=dt);

        // parent reference Used only for foreign key reference and doesn't contain any other fields.
        Account accountReference = new Account(MyExtID__c='SAP111111');                
        newOpportunity.Account = accountReference;

        // Create the Account object to insert andSame as above but has Name field and Used for the insert.
        Account parentAccount = new Account(Name='Hallie',MyExtID__c='SAP111111');      

        // Create the account and the opportunity.
        Database.SaveResult[] results = Database.insert(new SObject[] { parentAccount, newOpportunity });

        // Check results.
        for (Integer i = 0; i < results.size(); i++) {
            if (results[i].isSuccess()) {
            System.debug('Successfully created ID: '
                  + results[i].getId());
            } else {
            System.debug('Error: could not create sobject '
                  + 'for array element ' + i + '.');
            System.debug('   The error reported was: '
                  + results[i].getErrors()[0].getMessage() + '\n');
            }
        }
    }
}