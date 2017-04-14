trigger MultiChidCreation on Duplicate_Account__c (after insert) {

       if(MultiChildCreateHelperClass.run){      
            for(integer i=0;i<3;i++){
           for(Duplicate_Account__c acc:trigger.new){
               system.debug('>>>new duplicate account creation');
     Duplicate_Account__c dup = new Duplicate_Account__c(Account__c=acc.Account__c,Name ='Children'+i,
                                                                        Date_30__c=acc.Date_30__c.addDays(30));
                MultiChildCreateHelperClass.run=false;
                insert dup;
              system.debug('>>>after duplicate account creation');}
          }
        }
     }