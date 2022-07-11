public with sharing class UseOfExternalID {
    public static void createAccountWithFieldAndOpportunity() {
        Opportunity newOpportunity = new Opportunity(
            Name='OpportunityWithAccountInsert',
            StageName='Prospecting',
            CloseDate=Date.today().addDays(7));
        
        // Create the parent record reference.
        // An account with external ID = 'SAP111111' already exists.
        // This sObject is used only for foreign key reference
        // and doesn't contain any other fields.
		/For Adding Record IN account*******!
        Account accountReference = new Account(
          //MyExtID__c='SAP111111',Name='AccountExternal'); 
		  //insert accountReference;
		 
		//For Adding Opportunity In Account Object 
        Account accountReference = new Account(
            MyExtID__c='SAP111111'); 
			
        // Add the account sObject to the opportunity.
        newOpportunity.Account = accountReference;
        
        // Create the opportunity.
        Database.SaveResult results = Database.insert(newOpportunity);
        System.debug('Final Result is  ' +results);
    }
}
/*
HOW TO RUN IN ANONYMOUS WINDOW :-> 
    UseOfExternalID.createAccountWithFieldAndOpportunity();*/