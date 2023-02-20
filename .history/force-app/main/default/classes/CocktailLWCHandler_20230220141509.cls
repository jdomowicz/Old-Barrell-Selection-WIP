public with sharing class CocktailLWCHandler {


    @AuraEnabled(cacheable = true)
    public static List<Coctail__c> getExisitngCocktailByIngredient(){

        List<Coctail__c> = [Select Id,Name from ];


    }

    @AuraEnabled(cacheable = true)
    public static List<Coctail__c> getExistingCocktailByName(){


    }

}