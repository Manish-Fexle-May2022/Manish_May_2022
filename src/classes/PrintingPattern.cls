public with sharing class PrintingPattern {
    public void downTrianglePattern(){
        for(Integer i=1;i<=5;i++)
        {
            String Pattern='';
            for(Integer j=1;j<=9;j++)
            {
                if(i==j || i+j==10 || i==1)
                    Pattern = Pattern + '*';
                else
                    Pattern = Pattern + '_';
            }
            System.debug(Pattern);
         }
    }    
   
    public void leftTrianglePascal(){
        Integer k=0;
        for(Integer i=1;i<=9;i++)
        {
             if(i<=5)
                k++;
             else 
                k--;
             String Pattern1='';
             for(Integer j=1;j<=5;j++)
             {
                if(j>=6-k)
                    Pattern1 = Pattern1 + '*';
                else
                    Pattern1 = Pattern1 + '_';
             }
            System.debug(Pattern1);
         }
    }
}
