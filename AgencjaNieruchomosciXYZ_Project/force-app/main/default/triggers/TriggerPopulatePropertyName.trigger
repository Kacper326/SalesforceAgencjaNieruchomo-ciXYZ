trigger TriggerPopulatePropertyName on Property__c (before insert, before update) {
  Id PropertyRecordTypeId = Schema.SObjectType.Property__c.getRecordTypeInfosByName().get('House').getRecordTypeId();
    for (Property__c prop : Trigger.new) {
    prop.Name = null;
    if (prop.RecordTypeId == PropertyRecordTypeId) {
        prop.Name =  'Dom/Mieszk | ' + prop.Property_City__c + ' | ' + prop.Property_Street__c + ' ' + prop.Property_Number__c;
    } else {
        prop.Name = 'Biuro | ' + prop.Property_City__c + ' | ' + prop.Property_Street__c + ' ' + prop.Property_Number__c;
    }
  }
}