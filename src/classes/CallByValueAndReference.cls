public with sharing class CallByValueAndReference {
    //Call by value and call by reference
    public CallByValueAndReference() {
        Account a = new Account();
        a.Name = 'salessoft';
        a.Website = 'www.Manishsales.com';
        changeWebsite(a);
        System.debug('Website - '+a.Website);
    }
    public Account changeWebsite(Account b) {
        //Create New Object and try to replace old
        b = new Account();
        b.Website = 'www.salesforce.com';
        System.debug = ('Website = '+b.Website);
        return b;
    }
}
