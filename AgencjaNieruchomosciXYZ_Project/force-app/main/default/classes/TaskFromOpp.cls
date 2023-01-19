public with sharing class TaskFromOpp {
    public static Task TaskFromOppCreation(Opportunity opp) {
        Task task = new Task(Subject = 'Follow Up Test Task',
                             WhatId = opp.Id,
                             ActivityDate = System.today() + 7,
                             Description = 'Task Created from Opportunity: ' + opp.Name);
            return task;
    }
}