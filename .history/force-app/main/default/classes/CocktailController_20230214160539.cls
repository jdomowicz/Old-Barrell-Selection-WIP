public with sharing class CocktailController {


    public list<Coctail__c> getCocktailsByExternalId(list<String> drinkExternalIds){

        return [Select Id,Name,Drink_External_Id__c from Coctail__c where Drink_External_Id__c IN: drinkExternalIds];

    }

    public 

}