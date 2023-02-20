public with sharing class CocktailController {
    

    public list<Coctail__c> getCocktailsByExternalId(String Drink_External_Id__c){


        return [Select Id,Name from Coctail__c where ]

    }

}