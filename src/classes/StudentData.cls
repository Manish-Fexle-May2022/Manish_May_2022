public with sharing class StudentData {
    public StudentData() {
         // Define a Nested Map
         Map<String, Map<String, List<Student__c>>> StudentDataclassmap = new Map<String, Map<String, List<Student__c>>>();
         //****************Hierarchical Collection example using Map and List***************
         //1st year List of Student
         //get the id of 1st year record
         List<Year_Of_Class__c> firstyearofclass = [select id from Year_Of_Class__c where Name = '1stYear' ];
        
         //1st year Computer Science List
         List<Student__c>  firstyearlistcomputer = [select id, Name, Roll_Number__c, Year_Of_Class__c, Stream__c  
                                                   from Student__c 
                                                   where Year_Of_Class__c IN : firstyearofclass
                                                   AND Stream__c = 'Science'];
         for(Student__c student : firstyearlistcomputer){
             system.debug(student);
         }
         Map<String, List<Student__c>> mapofstudentfirstyear = new Map<String, List<Student__c>>();
         mapofstudentfirstyear.put('Science',firstyearlistcomputer);
 
         //1st year Arts List
         List<Student__c>  firstyearlistdigital =[Select id, Name, Roll_Number__c, Year_Of_Class__c, Stream__c
                                                 From Student__c 
                                                 where Year_Of_Class__c IN : firstyearofclass
                                                 AND Stream__c = 'Arts' 
                                                 ];
         for(Student__c student : firstyearlistdigital){
             system.debug(student);
         }
         mapofstudentfirstyear.put('Arts',firstyearlistdigital);
 
         // get the id 2nd year record
         List<Year_Of_Class__c> secondyearofclass = [select id from Year_Of_Class__c where Name = '2ndYear' ];
 
         //2ndyear List of Student
         //2ndyear Commerce List
         List<Student__c>  secondyearlistelectronic =[select id, Name, Roll_Number__c, Year_Of_Class__c, Stream__c 
                                                     from Student__c 
                                                     where Year_Of_Class__c IN : secondyearofclass
                                                     AND Stream__c = 'Commerce' 
                                                     ];
         for(Student__c student : secondyearlistelectronic){
             system.debug(student);      
         }
 
         Map<String, List<Student__c>> mapofstudentsecondyear = new Map<String, List<Student__c>>();
         mapofstudentsecondyear.put('Commerce',secondyearlistelectronic);
 
         //2ndyear Computer Science List
         List<Student__c>  secondyearlistcomputer =[select id, Name, Roll_Number__c, Year_Of_Class__c, Stream__c
                                                     from Student__c 
                                                     where Year_Of_Class__c IN : secondyearofclass
                                                     AND Stream__c = 'Computer Science' 
                                                     ];
         for(Student__c student : secondyearlistcomputer){
             system.debug(student);      
         }
 
         mapofstudentsecondyear.put('Computer Science',secondyearlistcomputer);
 
         //put the 1styear student in nested map
         StudentDataclassmap.put('1stYear',mapofstudentfirstyear);
         //put the 2ndyear student in nested map
         StudentDataclassmap.put('2ndYear',mapofstudentsecondyear);
        }
    }