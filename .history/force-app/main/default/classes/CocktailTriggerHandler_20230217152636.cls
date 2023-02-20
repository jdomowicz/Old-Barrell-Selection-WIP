public with sharing class CocktailTriggerHandler {

    public void beforeUpdateRemoveDuplicate(map<Id,Coctail__c> newContactsMap){

        for(Coctail__c c : newContactsMap.values()){

            if(c.PictureURL__c =! newContactsMap.get(c.id).PictureURL__c){

                system.debug('Oppty URL has changed');

            }

        }




    }
}