//Class to query records from child to parent object
public with sharing class QueryChildToParent{
    //This method will query records from child to parent standard object
    public void onStandardObject(Integer size){
        List<Contact> listContact =  new List<Contact>();
        Account recAccount = [Select Name From Account Where Name = 'Acme1' limit 1];
        
        //Inserting Records
        for(Integer i=1 ;i<=size; i++){
            listContact.add(new Contact(FirstName = 'Con', LastName = ''+i, AccountId = recAccount.Id));
        } 
        insert listContact;
        
        //Updating Records
        recAccount = [Select Name from Account where Name = 'Acme2'LIMIT 1];
        for(Contact recContact : listContact){
            recContact.AccountId = recAccount.Id;
        }
        update listContact;
        
        //Querying inserted records
        for(Contact recContact : [Select Name, Account.Name From Contact Where Name like 'Con%']){
            System.debug('Name : '+recContact.Name+', Account Name : '+recContact.Account.Name);
        }       
        
        //Deleteing Records
        delete listContact;
    }
}

