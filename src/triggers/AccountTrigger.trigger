trigger AccountTrigger on Account (before insert, after insert) {
    if(trigger.isBefore){
        System.debug('Before Trigger Operation.............');
        if(trigger.isInsert){
            AccountEmailTrigger.updateAccountNumberASPerAccountType(Trigger.new);
        }
    }
    if(trigger.isAfter){
        System.debug('After Trigger Operation............');
        AccountEmailTrigger.sendEmail(Trigger.new);
    }
}
