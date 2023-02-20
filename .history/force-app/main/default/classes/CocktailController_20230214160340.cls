public with sharing class CocktailController {
    

    public list<Coctail__c> getCocktailsByExternalId(list<String> drinkExternalIds){


        return [Select Id,Name from Coctail__c where Drink_External_Id__c IN: drinkExternalIds];

    }

}