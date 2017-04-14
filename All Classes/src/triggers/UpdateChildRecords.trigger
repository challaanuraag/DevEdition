trigger UpdateChildRecords on Account (before update, after update) {
   
   
set<Id> acctIds = new set<Id>();
map<Id, Account> mapAccount = new map<Id, Account>();

  List<Duplicate_Account__C> Listdupeaccs=  new List<Duplicate_Account__C>();
    
	for(Account acct : trigger.new) {
	 acctIds.add(acct.Id);
	 mapAccount.put(acct.Id, acct);
	}

  Listdupeaccs  = [select id,phone__C, Billing_City__C,Account__C 
                                          from Duplicate_Account__c where Account__C IN :acctIds];

  if(Listdupeaccs.size() > 0) {
     for(Duplicate_Account__c dupe : Listdupeaccs){
    	dupe.Billing_City__c = mapAccount.get(dupe.Account__C).BillingCity;
        dupe.Phone__c = mapAccount.get(dupe.Account__C).Phone;
     	update Listdupeaccs;   
     }
	
  }
}    






/*
    //List<Duplicate_Account__C> dupeaccs=  new List<Duplicate_Account__C>();
   
      for(Account a:trigger.new){   
          Duplicate_Account__C acc = new Duplicate_Account__C();
			acc.name=a.id;
            acc.Billing_City__c=a.BillingCity;
          	acc.Phone__c=a.Phone;
         insert(acc);
        }
 // insert(dupeaccs);
    }



/*List<Id> idAccount = new List<Id>{};
Map<Id, Account> AccountDetails = new Map<Id,Account>();    
    
    for(Account a: Trigger.new){
    idAccount.add(a.id);
    AccountDetails.put(a.id,a);}
    
    Duplicate_Account__c[] ACCUpdate = [select id,phone__C, Billing_City__C 
                                          from Duplicate_Account__c where Duplicate_Account__c.ID IN :idAccount];

    for(Duplicate_Account__c dupe : ACCUpdate){
    	dupe.Billing_City__c = AccountDetails.get(dupe.ID).BillingCity;
        dupe.Phone__c = AccountDetails.get(dupe.ID).Phone;
        }

update ACCUpdate;

}*/