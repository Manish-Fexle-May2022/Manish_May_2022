public with sharing class Student {
    String name ;

    public Student() {
        Student__c st = new Student__c();
        st.name = 'Manish Prajapati';
        integer i = 10;
        dataRefernce(st);
        system.debug('Check Student Name : '+st.name);
        dataValue(i);
        system.debug('Check I : '+i);
    }

    public void dataRefernce(Student__c studentdata){
        for(integer  i = 0; i<10;i++){
            studentdata.name = studentdata.name + i;
        }
    }

    public void dataValue(integer i){

        i = 50;
        system.debug('Check I : '+i);
    }
    //For exicute this Use  new Student();
}