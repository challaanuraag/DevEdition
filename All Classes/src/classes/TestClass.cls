@isTest
Public class TestClass{
static testMethod void verifyAccountDescriptions(){
    List<Account> accounts = new List<Account>{};
        
    for(Integer i = 0; i < 200; i++){
        Account a = new Account(Name = 'Test Account ' + i);
        accounts.add(a);
    }

    test.startTest();
		
    insert accounts; 
		
    test.stopTest();
		
    List<Account> insertedAccounts = [SELECT Name, Description 
                                      FROM Account 
                                      WHERE Id IN:accounts];
		
    for(Account a: insertedAccounts){
      System.assertEquals(
        'This Account is probably left over from testing. It should probably be deleted.', 
        a.Description);
    }
}
}