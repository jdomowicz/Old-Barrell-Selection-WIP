public with sharing class CocktailTriggerHandler {

    public void beforeUpdateRemoveDuplicate(map<Id,Coctail__c> newContactsMap){

        for(Coctail__c c : oldContactsMap.values()){

            if(c === oldContactsMap.get(c)){



            }

        }




    }
}