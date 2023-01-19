trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    List<Task> taskToCreate = new List<Task>();
    List<Opportunity> ClosedWonOpp = [SELECT Id,Name,StageName From Opportunity Where(StageName = 'Closed Won' AND Id IN :Trigger.new)];

    for (Opportunity opp : ClosedWonOpp){
        taskToCreate.add(TaskFromOpp.TaskFromOppCreation(opp));
    }
 
    if (taskToCreate.size() > 0){
        insert taskToCreate;
    }
   
}