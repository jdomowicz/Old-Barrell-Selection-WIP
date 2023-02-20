public with sharing class CocktailLWCHandler {


    @AuraEnabled(cacheable = true)
    public static List<Coctail__c> getExisitngCocktailByIngredient(String inggredient){

        List<Coctail__c> = [Select Id,Name from Coctail__c WHERE Ingredient1__c LIKE '%inggredient%'];


    }

    @AuraEnabled(cacheable = true)
    public static List<Coctail__c> getExistingCocktailByName(){


    }

}