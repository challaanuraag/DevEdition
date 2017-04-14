trigger Gou2Trigger on Duplicate_Account__c (After insert) {
    if(SampleHelper.run)
   {
      SampleHelper.run = false;
      if(Trigger.isInsert && Trigger.isAfter)
      { 
       integer i=1;
       while(i<=3)
       {
           system.debug('>>>');
          createChild(Trigger.new,i);      
          i= i+1;
       }
     }
    }
     public void createChild(List<Duplicate_Account__c>  accList,integer i)
   {  
       system.debug('>>> List of Duplicate Accounts'+acclist);
   for(Duplicate_Account__c acc:accList) 
   {
        Duplicate_Account__c duacc=[select Date_30__c,Child_Number__c,createddate from Duplicate_Account__c where Account__c= :acc.Account__c order by Date_30__c DESc limit 1 ];     
        
         system.debug('>>>child number'+duacc.Child_Number__c +'  --'+duacc.createddate);
        // System.debug();
       system.debug('dup acc is '+i+' '+duacc);
       Duplicate_Account__c Dacc=new Duplicate_Account__c() ;
       Dacc.name=acc.name+i;
       Dacc.Child_Number__c=i;
       Dacc.Account__c=acc.Account__c;
       Dacc.Date_30__c=duacc.Date_30__c.addDays(30);
       system.debug('Dupluicate Account Date'+duacc.Date_30__c);
       system.debug('Dupluicate Account Date Added'+duacc.Date_30__c.addDays(30));
            insert Dacc;
        }
       }
}