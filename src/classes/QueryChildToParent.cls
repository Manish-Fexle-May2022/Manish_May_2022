public with sharing class QueryChildToParent {
    public void childToParent(){
        for(Account objAccount: [SELECT Id, Name, (SELECT Id, LastName FROM Contacts)  FROM Account LIMIT 1])
        {
            for(Contact objContact: objAccount.Contacts)
            {
                system.debug('====Contact Info======'+objContact);
            }
        }
    }
}