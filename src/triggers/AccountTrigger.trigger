trigger AccountTrigger on Account (before insert, after insert) {
    if(trigger.isBefore){
        System.debug('Before Trigger Operation.............');
        if(trigger.isInsert){
            AccountTriggerHandler.updateAccountNumberASPerAccountType(Trigger.new);
        }
    }
    if(trigger.isAfter){
        System.debug('After Trigger Operation............');
        AccountTriggerHandler.sendEmail(Trigger.new);
    }
}