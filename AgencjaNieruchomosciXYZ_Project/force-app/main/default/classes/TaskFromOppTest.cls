@isTest
public with sharing class TaskFromOppTest {
    @isTest static void ClosedWonOpportunity() {

        Opportunity opp = new Opportunity(Name = 'TestOpp', StageName = 'Analysis', CloseDate = System.today() + 10);
        insert opp;

        opp.StageName = 'Closed Won';
        update opp;

        Task resultTask = [SELECT Subject,WhatId,Description FROM Task WHERE WhatId = :opp.Id LIMIT 1];
        String StringCompare = 'Task Created from Opportunity: TestOpp';
        Boolean result = resultTask.Description.equals(StringCompare);
        System.assertEquals(true,result);

    }
}