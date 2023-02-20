public with sharing class CocktailTriggerHandler {

    public void beforeUpdateRemoveDuplicate(list<Contact> cList, map<Id,Coctail__c> newContactsMap){

        for(Coctail__c c : newContactsMap.values()){

            if(c.PictureURL__c === newContactsMap.get(c.id).PictureURL__c){

                c.AddError('Drink URL has not changed');

            }

        }




    }
}