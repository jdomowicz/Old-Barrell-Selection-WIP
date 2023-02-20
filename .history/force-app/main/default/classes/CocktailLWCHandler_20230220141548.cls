public with sharing class CocktailLWCHandler {


    @AuraEnabled(cacheable = true)
    public static List<Coctail__c> getExisitngCocktailByIngredient(String ingredient){

        List<Coctail__c> = [Select Id,Name from Coctail__c WHERE ];


    }

    @AuraEnabled(cacheable = true)
    public static List<Coctail__c> getExistingCocktailByName(){


    }

}