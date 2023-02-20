public with sharing class CocktailTriggerHandler {

    public void beforeUpdateRemoveDuplicate(list<Contact> newList, map<Id,Coctail__c> oldContactsMap){

        for(Coctail__c c : newList){

            if(c.PictureURL__c === oldContactsMap.get(c.id).PictureURL__c){

                c.AddError('Drink URL has not changed');

            }

        }




    }
}