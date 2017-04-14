@isTest
public class Gou2TriggerTestClass {
    Static testmethod void Gou2TriggerTesting(){
       // List <Duplicate_Account__c> dupes = new <Duplicate_Account__c>();
        Account acc = new Account(name='Carpediem1');
               insert acc;
        Duplicate_Account__C dupe = new Duplicate_Account__C(name=acc.name,account__C=acc.Id);
         dupe.Status__c = 'open';
            insert dupe;
             Test.startTest();
        
    	BatchClass batch1 = new BatchClass();
       ID batchprocessid = Database.executeBatch(batch1);
          	Test.stopTest();
        List<Duplicate_Account__c> listdupe = [Select name,Child_Number__C, Account__c, Date_30__C from Duplicate_Account__c
                                              Where account__C =: acc.Id];
        System.assertEquals(5,listdupe.size());
        System.debug('list is'+listdupe);
                    
             Duplicate_Account__C dupeacc = [Select name,Child_Number__C, Status__C,Account__c, Date_30__C from Duplicate_Account__c
                                              Where account__C =: acc.Id and Child_Number__C =:0 limit 1];
            system.assertEquals('Closed',dupeacc.Status__c);
        }
    }