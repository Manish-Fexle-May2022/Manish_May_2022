public with sharing class DmlWorking {
    // HOW DML WORKS ?
    public static void perfectUseOfDmlStatements() {
        List<Contact> updatedList = new List<Contact>();
        List<Contact> conList = [Select Title , Description from Contact LIMIT 1];
        for(Contact con : conList) {
            if (con.Title == 'CFO') {
                con.Description = 'Newest Description';
                updatedList.add(con);
            }
        }
        update updatedList;
        System.debug('Contact List ' +updatedList);
    }
    /*
HOW TO RUN IN ANONYMOUS WINDOW :-> 
DmlWorking.perfectUseOfDmlStatements();*/
    
    // ADDING AND RETRIEVING THE DATA
    public static void addingAndRetrievingData(){
        Account accOne = [SELECT Name,Industry FROM Account WHERE Name = 'Karthik Kumawat' LIMIT 1];
        System.debug('Name => ' + accOne.Name); 
        System.debug('Name => ' + accOne.Industry); 
        
        accOne.Name = 'Swapnil Kataria';
        accOne.Industry = 'Dell-Mart';
        
        update accOne;
        System.debug('List ' +accOne);
    }
    /*
HOW TO RUN IN ANONYMOUS WINDOW :-> 
DmlWorking.addingAndRetrievingData();*/
    
    // INSERTING AND UPDATING RECORDS -->>
    // INSERTING RECORD
    public static void insertingRecord(){
        try{
            Account acc = new Account(Name='SFDC Account');
            insert acc;
            
            ID accID = acc.ID;
            
            Contact con = new Contact(FirstName='David', LastName='Mallan', Phone='+12435467598', AccountId=accID);  
            insert con;
            
            System.debug('Account '+acc);
            System.debug('Contact ' +con);
        }catch(DmlException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    /*
HOW TO RUN IN ANONYMOUS WINDOW :-> 
DmlWorking.insertingRecord();*/
    
    // UPDATING RECORD
    public static void updatingRecord(){     
        try {
            Contact updateContact = [SELECT Account.Name 
                                     FROM Contact 
                                     WHERE FirstName = 'David' AND LastName='Mallan'
                                     LIMIT 1];
            
            updateContact.Phone = '+919045678444';
            updateContact.Account.Industry = 'Gen-Pack';
            
            update updateContact;
            
            update updateContact.Account; 
            System.debug('Updated ' +updateContact);
        } catch(Exception e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    /*
HOW TO RUN IN ANONYMOUS WINDOW :-> 
DmlWorking.updatingRecord();*/
    
    // VARIOUS DML OPERATIONS
    // 1. INSERTING
    public static void insertingRecordToDatabase(){
        List<Account> accList = new List<Account>();
        Account insertAccOne = new Account(Name='Tech-Trash-One', Phone='3454678766');
        Account insertAccTwo = new Account(Name='Tech-Trash-Two', Phone='3478657896');
        accList.add(insertAccOne);
        accList.add(insertAccTwo);
        insert accList;
        
        System.debug('RecordList -' +accList);
    }
    /*
HOW TO RUN IN ANONYMOUS WINDOW :-> 
DmlWorking.insertingRecordToDatabase();*/
    
    // INSERTING A CONTACT
    public static void insertingContact(){
        Account insertAccThree = new Account(Name='Tech-Trash-Three', Phone='3451231243');
        insert insertAccThree;
        
        Contact con = new Contact(FirstName='Manish', LastName='Prajapati',AccountId=insertAccThree.Id);
        insert con;
        
        System.debug('Account List -> ' +insertAccThree);
        System.debug('Contact List ->' +con);
        
        /*
Contact con = [SELECT Id,FirstName,LastName,Phone FROM Contact WHERE FirstName = 'Manish' AND LastName = 'Prajapati'];
con.Phone = '123456';

update con;
*/
    }
    /*
HOW TO RUN IN ANONYMOUS WINDOW :-> 
DmlWorking.insertingContact();*/
    
    
    // 2. UPDATING
    public static void updatingRecordToDatabase(){
        Account acc = [SELECT Id,Name,Phone FROM Account WHERE Name='Tech-Trash-One' LIMIT 1];
        System.debug('Acc => ' +acc);
        acc.Phone = '909999';
        update acc;
        
        Account updatedAcc = [SELECT Id,Name,Phone FROM Account WHERE Name='Tech-Trash-One' LIMIT 1];
        System.debug('Updated List -> ' +updatedAcc);
        System.assertEquals(updatedAcc.Phone, acc.Phone, 'Equal');
    }
    /*
HOW TO RUN IN ANONYMOUS WINDOW :-> 
DmlWorking.updatingRecordToDatabase();*/
    
    // 3. UPSERT
    public static void upsertRecord(){
        List<Account> combine = new List<Account>();
        Account a = new Account(Name='Tech-Trash-Four', Phone = '232323');
        Account b = [SELECT Id,Name, Phone FROM Account WHERE Name='Tech-Trash-Two' LIMIT 1];
        b.Phone = '777777';
        combine.add(a);
        combine.add(b);
        
        upsert combine;
        System.debug('Inserted And Updated List ' +combine);
    }
    /*
HOW TO RUN IN ANONYMOUS WINDOW :-> 
DmlWorking.upsertRecord();*/
    
    // 4. MERGE
    public static void mergeRecord(){
        // Accessing a existing Account record which do not have any contact
        Account acc4 = [SELECT Id, Name, Phone FROM Account WHERE Name='Tech-Trash-Four' LIMIT 1];
        // Accessing a existing record which have contact details
        Account accMerge = [SELECT Id, Name, Phone FROM Account WHERE Name='Tech-Trash-Three'];
        // Now initiate the Merge operation
        merge acc4 accMerge;
        System.debug('After Merge ' +acc4);
    }
    /*
HOW TO RUN IN ANONYMOUS WINDOW :-> 
DmlWorking.mergeRecord();*/
    
    // 5. DELETE RECORDS
    public static void deleteRecord(){
        List<Account> delAcc = [SELECT Id,Name,Phone FROM Account WHERE Name = 'Tech-Trash-Two' LIMIT 1];
        delete delAcc;
        System.debug('Deleted record ' +delAcc);
    }
    /*
HOW TO RUN IN ANONYMOUS WINDOW :-> 
DmlWorking.deleteRecord();*/
    
    
    // 6. UNDELETE RECORDS
    public static void unDeleteRecord(){
        List<Account> deletedAcc = [SELECT Id,Name,Phone FROM Account WHERE Name = 'Tech-Trash-Two' ALL ROWS ];
        undelete deletedAcc;
        System.debug('Undeleted record ' +deletedAcc);
    }
    /*
HOW TO RUN IN ANONYMOUS WINDOW :-> 
DmlWorking.unDeleteRecord();*/
}
