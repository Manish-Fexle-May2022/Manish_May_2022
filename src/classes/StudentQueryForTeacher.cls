public class StudentQueryForTeacher {
    public StudentQueryForTeacher(){
    List<Student__c> studentList=  [SELECT id,Name,Roll_Number__c,Father_Name__c,Mobile_Number__c,Father_Mobile_Number__c,Home_Phone_Number__c,
                                    Address__c,Overall_Grade__c,Is_Donation__c,Donation_Amount__c,Pending_Overall_Amount__c,
                                    Stream__c,Class__c,Section__c,Current_Year__c,Fees_Submitted__c,Pending_Fees_Amount__c,Subjects_in_which_Back__c,
				    X1st_Sem_Percentage__c,X1st_Sem_Back__c,X2nd_Sem_Back__c,X2nd_Sem_Percentage__c,X3rd_Sem_Back__c,X3nd_Sem_Percentage__c,
				    X4th_Sem_Back__c,X4th_Sem_Percentage__c,
                                    Exam_Fees_Submitted__c FROM Student__c order by createddate DESC LIMIT 5];
     for(Student__c student:studentList)
     system.debug('Data of Student:::'+ student);   
         
    }
}
