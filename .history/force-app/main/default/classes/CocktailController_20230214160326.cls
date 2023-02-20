public with sharing class CocktailController {
    

    public list<Coctail__c> getCocktailsByExternalId(list<String> Drink_External_Id__c){


        return [Select Id,Name from Coctail__c where Drink_External_Id__c IN: ]

    }

}