public with sharing class PracticeOperators {
       //Assignment Operator
       public static void assignmentOperator(){
           Integer x,y;
           x = 5;
           y = x;
           x=y;
           System.debug(x);       
        }
        
        //Addition Assignment 
         public static void additionAssignmentOperator(){
            Integer x,y;
            x = 12;
            y = 11;                 
            x+=y;
           System.debug(x);
        }
        
        //Multiplication Assignment Operator
          public static void multiplicationAssignmentOperator(){
             Integer x,y;
             x = 3;
             y = 6;
             x*=y;
           System.debug(x);
         }
            
         //Subtraction Assignment Operator
          public static void subtractionAssignmentOperator(){
              Integer x,y;
              x = 66;
              y = 22;
              x-=y; 
              System.debug(x);
          }
        
          //Division Assignment Operator
           public static void divisonAssignmentOperator(){
               Integer x,y;
               x = 14;
               y = 7;
               x/=y;
               System.debug(x);  
            }
        
            // OR Assignment Operator
            public static void orAssignmentOperator(){
                Boolean x,y;
                x=false;
                y=false;
                System.debug(x |= y);
            }
        
            // AND Assignment Operator
            public static void andAssignmentOperator(){
                Boolean x,y;
                x=false;
                y=false;
                System.debug(x &= y);
            }
        
            public static void andAssignmentOperator_1(){
                Integer x,y;
                x=33;
                y=33;
                System.debug(x &= y);
            }
        
            // Ternary Operator
            public static void ternaryOperator(){
                Boolean sunday = true;
                String msg = sunday ? 'Today is  Sunday' : 'Today is not Sunday.';
                System.debug('Message - ' + msg);
            } 
        
            // Decrement Operator
            public static void decrementOperator(){
                Integer x;
                x=10;
                x--;
                System.debug(x);
            }
        
            // Unary Negation Operator
            public static void unaryNegationOperator(){
                Integer x;
                x=10;
                System.debug(-x);
            }
        
            // Logical Complement Operator
            public static void logicalComplementOperator(){
                Boolean x;
                x=false;
                System.debug(!x);
            }
            
            // Inequality Operator
            public static void inequalityOperator(){
                Integer x,y;
                x=5;
                y=10;
                System.debug(x!=y);
            }
        
            // Less Than Operator
            public static void lessThanOperator(){
                Integer x,y;
                x=5;
                y=10;
                System.debug(x<y);
            }
        
            // Greater Than Operator
            public static void greaterThanOperator(){
                Integer x,y;
                x=5;
                y=10;
                System.debug(x>y);
            }
        
            // Equality Operator
            public static void equalityOperator(){
                Integer a,b;
                a=77;
                b=77;
                System.debug(a == b);
            }
               //SafeOperator
            public static void safeOperator(){
               String a=NULL;
               String b='abc';
               System.debug(a==null? b:a);
               Account acc =new Account();
               acc.Name='test';
               insert acc;
               System.debug([SELECT ID , Name FROM Account where ID=:acc.ID]?.NAME);
        }
  }