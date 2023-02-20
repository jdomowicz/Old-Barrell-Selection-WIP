public with sharing class CocktailTriggerHandler {

    public void beforeUpdateRemoveDuplicate(map<Id,Coctail__c> newContactsMap){

        List<Coctail__c> cList = new list <Coctail__c>();

        for(Coctail__c c : newContactsMap.values()){

            if(c.PictureURL__c === newContactsMap.get(c.id).PictureURL__c){

                c.AddError(['Drink URL has not changed']);

            }

        }




    }
}