public class InsertStudentForRegistrar {
    public InsertStudentForRegistrar(){
        
    //Student Personal Information
    Student__c student= new Student__c();     
    student.Name= 'Vivek';
    Student.Roll_Number__c=12345;
    student.Father_Name__c='Sahil';
    student.Mobile_Number__c='7568529456';
    student.Father_Mobile_Number__c='7568569856';
    student.Home_Phone_Number__c='0141456289';
    student.Address__c='22 shyam vihar';
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
     
    //Bank Details
    student.Bank_Name__c='SBI bank jaipur';
    student.IFSC_Code__c='Jai1234poi';
    student.Account_Number__c=123546;
    student.Bank_Phone_Number__c='0141456256';
    student.State__c='Rajasthan';
    student.City__c='Jaipur';   
    insert student; 
    system.debug('inserted record id:::'+ student.id );   
    }
}