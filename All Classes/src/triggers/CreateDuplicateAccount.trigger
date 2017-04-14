trigger CreateDuplicateAccount on Account (after insert,before update,after update) {
    if(trigger.isInsert||trigger.isBefore){
        for(Account a:trigger.new){
            Duplicate_Account__C DupeAcc = new Duplicate_Account__C ();
            DupeAcc.Account__c = a.Id;
            DupeAcc.Name = a.name;
            DupeAcc.Phone__c = a.Phone;
            DupeAcc.Billing_City__c = a.BillingCity;
            insert(DupeAcc);
        }
        
    }
}