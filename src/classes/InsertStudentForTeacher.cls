public class InsertStudentForTeacher {
    public InsertStudentForTeacher (){
        
    //Student Personal Information
    Student__c student= new Student__c();     
    student.Name= 'Ravi';
    student.Roll_Number__c=12345;
    student.Father_Name__c='Rajesh';
    student.Mobile_Number__c='7568529456';
    student.Father_Mobile_Number__c='7568569856';
    student.Home_Phone_Number__c='0141456289';
    student.Address__c='56 shyam vihar';
    student.Overall_Grade__c='A+';
  
    //Class info
    student.Stream__c='Science';
    student.Class__c='12th';
    student.Section__c='Section A';
     
    //Fees Details
    student.Current_Year__c=date.parse('2/08/2022');
    student.Fees_Submitted__c=False;
    student.Pending_Fees_Amount__c=100;
    student.Exam_Fees_Submitted__c=true;
    student.Pending_Exam_Fees__c=00;
    student.Is_Donation__c=true;
    student.Donation_Amount__c=100;
    student.Pending_Overall_Amount__c=30;    
    insert student; 
	
	//student semester details
     student.Subjects_in_which_Back__c='Mathematics';
     student.X1st_Sem_Percentage__c=72.90; 
     student.X1st_Sem_Back__c=true;
     student.X2nd_Sem_Back__c=true;
     student.X2nd_Sem_Percentage__c=80;
     student.X3rd_Sem_Back__c=false;
     student.X3nd_Sem_Percentage__c=89.85;
     student.X4th_Sem_Back__c=ture;
     student.X4th_Sem_Percentage__c=67;
     system.debug('inserted record id:::'+ student.id );    
    }
}
