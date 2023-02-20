public with sharing class CocktailController {
    

    public list<Coctail__c> getCocktailsByExternalId(){


        return [Select Id,Name from Coctail__c where ]

    }

}