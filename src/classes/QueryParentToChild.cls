public with sharing class QueryParentToChild {
    public void OpportunityAccount(){
        for(Account account :[select Name,(select Name from Opportunities)from Account]){
            System.debug('Account :' +account.Name);
            for(Opportunity opp :account.Opportunities){
                System.debug('Opportunty :'+opp.Name);
            }
        }
    }
    public void CollegeTeacher(){
        for(College__c college : [Select Name, (Select Name from Teachers__r) from College__c]){
            System.debug('College Name : '+college.Name);
            for(Teacher__c teacher : college.Teachers__r){
                System.debug('Teacher Name : '+teacher.Name);
            }
        }
    }
}