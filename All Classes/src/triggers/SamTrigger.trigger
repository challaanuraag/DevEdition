trigger SamTrigger on Account (before update,after update) {
list<Account> Accountlist = new list<Account>();
    Accountlist = [select BillingCity  from  Account];
    List<Duplicate_Account__c> listOfDupeacc =  new List<Duplicate_Account__c>();
    listOfDupeacc = [select Billing_City__c  from Duplicate_Account__c];
     for(Duplicate_Account__c  dupeacc :listOfDupeacc)
     
         {
        for(Account acc : Trigger.new)
        {
            dupeacc.Billing_City__c = acc.BillingCity;
           
            update dupeacc;
        }
             
         }
}