public with sharing class CocktailTriggerHandler {

    public void beforeUpdateRemoveDuplicate(map<Id,Coctail__c> oldContactsMap){

        for(Coctail__c c: oldContactsMap.keySet())




    }
}