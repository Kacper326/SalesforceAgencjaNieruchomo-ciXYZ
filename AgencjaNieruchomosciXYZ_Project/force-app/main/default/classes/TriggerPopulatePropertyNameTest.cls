@isTest
public with sharing class TriggerPopulatePropertyNameTest {
    @isTest
    static void testPopulatePropertyName() {

        Property__c testProperty = new Property__c();
        testProperty.Property_City__c = 'Test City';
        testProperty.Property_Street__c = 'Test Street';
        testProperty.Property_Number__c = '123';
        testProperty.Property_State__c = 'Dolnośląskie';
        testProperty.Property_Post_Code__c = '54-124';
        testProperty.m__c = 100;
        testProperty.Purchase_Price__c = 2137;
        testProperty.RecordTypeId = Schema.SObjectType.Property__c.getRecordTypeInfosByName().get('House').getRecordTypeId();
        insert testProperty;
        
        Property__c insertedProperty = [SELECT Name FROM Property__c WHERE Id = :testProperty.Id];
        System.assertEquals(insertedProperty.Name, 'Dom/Mieszk | Test City | Test Street 123');
        
        testProperty.RecordTypeId = Schema.SObjectType.Property__c.getRecordTypeInfosByName().get('Office').getRecordTypeId();
        update testProperty;
        
        insertedProperty = [SELECT Name FROM Property__c WHERE Id = :testProperty.Id];
        System.assertEquals(insertedProperty.Name, 'Biuro | Test City | Test Street 123');
    }
}