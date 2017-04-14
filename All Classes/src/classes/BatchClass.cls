global class BatchClass implements Database.Batchable<SObject>{

     global Database.Querylocator start (Database.BatchableContext BC) {
         Date today = System.today();
     return Database.getQueryLocator('Select id, name, Child_Number__c, Account__c, Date_30__c From Duplicate_Account__C WHERE Date_30__c = :today');
     }
    
    global void execute (Database.BatchableContext BC, List<SObject> scope) {
        	List<Duplicate_Account__c> NewDupeList = new List<Duplicate_Account__c>();
        	List<Duplicate_Account__c> Dupacc=new list<Duplicate_Account__c>() ;
    			for (sObject objScope: scope) { 
                     	Duplicate_Account__c newObjScope = (Duplicate_Account__c)objScope ;
                    	newObjScope.Status__c='Closed';
                 	    NewDupeList.add(newObjScope);
                    	system.debug('Value of Updated Duplicate Account '+NewDupeList);
                    	Database.update(NewDupeList);
                    	// lalalalalalalal
                    	//This is Delta-1 Change
          /*          Duplicate_Account__c duacc=[select Date_30__c,Child_Number__c,createddate 
                                                from Duplicate_Account__c where Account__c= :newObjScope.Account__c 
                                                order by Date_30__c DESc limit 1 ]; */
                    Duplicate_Account__c Dacc=new Duplicate_Account__c() ;
       					Dacc.name=newObjScope.name+'child';
                    	Dacc.Account__c=newObjScope.Account__c;
                    	Dacc.Date_30__c=newObjScope.Date_30__c.addDays(120);
                    system.debug('Duplicate Account Date'+newObjScope.Date_30__c);
       				system.debug('Duplicate Account Date Added'+newObjScope.Date_30__c.addDays(30));
           			Dupacc.add(Dacc); 
                }
    SampleHelper.run = false;
    insert Dupacc;
    }
     
    global void finish(Database.BatchableContext BC){
    }
}