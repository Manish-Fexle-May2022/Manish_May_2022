public with sharing class MethodOverloading {
    //Method Overloading
    public static Integer sum(integer firstNum,integer secondNum){
        integer s = firstNum+secondNum;        
        system.debug(s);
        return s;
    }	
    public static Integer sum(integer firstNum,integer secondNum,integer thridNum)
    {
        integer s = firstNum+secondNum+thridNum;        
        system.debug(s);
        return s;
    }
}
