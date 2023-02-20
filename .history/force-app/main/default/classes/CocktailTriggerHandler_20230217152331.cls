public with sharing class CocktailTriggerHandler {

    public void beforeUpdateRemoveDuplicate(map<Id,Coctail__c> newContactsMap){

        for(Coctail__c c : newContactsMap.values()){

            if(newRecord.PictureURL__c === oldContactsMap.get(c)){



            }

        }




    }
}