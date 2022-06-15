public class StudentQueryForRegistrar {
    public StudentQueryForRegistrar(){
   List<Student__c> studentList=  [select id,Name,Roll_Number__c,Father_Name__c,Mobile_Number__c,Father_Mobile_Number__c,Home_Phone_Number__c,
                                     Address__c,Overall_Grade__c,Bank_Name__c,Is_Donation__c,Donation_Amount__c,Pending_Overall_Amount__c,
                                     Stream__c,Class__c,Section__c,Current_Year__c,Fees_Submitted__c,Pending_Fees_Amount__c,State__c,City__c,
                                     Exam_Fees_Submitted__c,IFSC_Code__c,Account_Number__c,Bank_Phone_Number__c from Student__c order by createddate DESC limit 5];
    for(Student__c student:studentList)
    system.debug('Data of Student:::'+ student);   
         
    }
}