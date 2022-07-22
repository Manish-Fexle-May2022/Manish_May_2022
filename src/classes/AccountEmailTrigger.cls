public with sharing class AccountEmailTrigger {
    public static final String[] ValidChars = new String[] {'0','1','2','3','4','5','6','7','8','9'};
    public static final Integer IDLENGTH = 10;
    public static final Integer ValidCharsLength = ValidChars.size();
    
    //This Method Is Generating Random Account Number With Valid Chars and Length********!
    public static String generateAccountNumber(){
        String ID = '';
        for (Integer i = 0; i < IDLENGTH; i++){
            ID = ID + ValidChars[(Integer) (math.random() * (ValidCharsLength))];
        }
        return ID;
    }
    
    // This method is define the type of account and account Number********!
    public static void updateAccountNumberASPerAccountType(List<Account> accountList){
        for(Account acc : accountList){
            if(acc.Type == 'Saving'){
                acc.AccountNumber = 'SA-' + generateAccountNumber();
            }
            else if(acc.Type == 'FD'){
                acc.AccountNumber = 'FB-' + generateAccountNumber();
            }
        }
    }
    
    //This method send an Email after generate account*********!!
    public static void sendEmail(List<Account> accountList){
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        for(Account acc : accountList){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            List<String> sendTo = new List<String>();
            sendTo.add('manish.prajapat@fexle.com');
            mail.setToAddresses(sendTo);
            mail.setSubject('Account Was Created......');
            String body = 'Dear'  + acc.Name +', ';
            body += ' Congratulations Your '+acc.Type+ 'Account Has Been Created on your request. ';
            mail.setHtmlBody(body);
            mails.add(mail);
        }
        messaging.sendEmail(mails);
    }
}