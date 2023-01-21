public with sharing class TaskFromOpp {
    public static Task TaskFromOppCreation(Opportunity opp) {
        Task task = new Task(Subject = 'Odzewij się Email/Telefon do Contactu',
                             WhatId = opp.Id,
                             ActivityDate = System.today() + 7,
                             Description = 'Task stworzony z Opportunity: ' + opp.Name);
            return task;
    }
}