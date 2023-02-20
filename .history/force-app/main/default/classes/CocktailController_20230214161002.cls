public with sharing class CocktailController {

    public List<Coctail__c> removeDuplicateDrinks(list<Coctail__c> drinkExternalIds){

        map<Id,>

       List<Coctail__c> drinks = [Select Id,Name,Drink_External_Id__c from Coctail__c where Drink_External_Id__c IN: drinkExternalIds];

       for(Coctail__c c : drinkExternalIds){

        if(!drinkExternalIds.contains(c.Id)){

            system.debug('duplicate' + c.Id);
        }
       }



    }

}