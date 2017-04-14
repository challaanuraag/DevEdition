trigger MultiChildDetailsCreation on Duplicate_Account__c (after insert) {
  List<Duplicate_Account__C> DupeAccs = new List<Duplicate_Account__C>();
    
    for (Duplicate_Account__c newdupe: Trigger.New) {
	for(integer i=0;i<=2;i++){
            Duplicate_Account__C dupe = new Duplicate_Account__C ();
      	   dupe.Account__C=newdupe.Id;
        dupe.name=newdupe.name; 
          dupe.Billing_City__c=newdupe.Billing_City__c;
        insert dupe;
        //DupeAccs.add(dupe);
        }
//insert(DupeAccs);
}
}

    
    
    
    
    
    
    
    
    
    
    
    /*Duplicate_Account__C[] dupeacc = new Duplicate_Account__C[0];
    for(Duplicate_Account__C record: Trigger.new) {
        if(record.Account__C != null) {
            dupeacc.add(record);
        }
    }
    if(dupeacc.isEmpty()) {
        return;
    }
    Duplicate_Account__C[] newdupeacc = new Duplicate_Account__C[0];
     Account[] partners = [SELECT Id FROM Account WHERE RecordType.Name='Partner'];
    for(Account partner: partners) {
     for(Duplicate_Account__C record: dupeacc) {
            newdupeacc.add(new Duplicate_Account__C());
        }
    
}*/