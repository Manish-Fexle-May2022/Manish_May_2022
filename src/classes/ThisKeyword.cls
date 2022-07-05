public with sharing class ThisKeyword {
    
    public void parent() {
        System.debug('Hello Parent'); 
    } 
    
    public void child() {  
        System.debug('Hello Child');  
        this.parent();  
    }  
    /*ThisKeyword n = new ThisKeyword();
     n.child(); For Execute use This*/
}