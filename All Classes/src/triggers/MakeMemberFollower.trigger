trigger MakeMemberFollower on OpportunityTeamMember (after insert) {
     if(Trigger.isInsert && Trigger.isAfter)
      { 
       List<EntitySubscription> entitySubList = new List<EntitySubscription>();
        List<OpportunityTeamMember> oppTMSubList = trigger.new;
        
         for(OpportunityTeamMember TM:oppTMSubList){
               EntitySubscription entitySub = new EntitySubscription();
             entitySub.ParentId = TM.OpportunityId;
             entitySub.SubscriberId = TM.UserId ;
              entitySubList.add(entitySub);
    }
          insert entitySubList;
    
}
      }