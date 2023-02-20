public with sharing class CocktailTriggerHandler {

    public void beforeUpdateRemoveDuplicate(list<Contact> newList, map<Id,Coctail__c> oldContactsMap){

        for(Coctail__c c : newList.values()){

            if(c.PictureURL__c === newContactsMap.get(c.id).PictureURL__c){

                c.AddError('Drink URL has not changed');

            }

        }




    }
}