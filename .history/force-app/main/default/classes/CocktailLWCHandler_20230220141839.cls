public with sharing class CocktailLWCHandler {


    @AuraEnabled(cacheable = true)
    public static List<Coctail__c> getExisitngCocktailByIngredient(String inggredient){

        List<Coctail__c> cocktails = new List<Coctail__c>();
        if(String.isEmpty(inggredient))

        cocktails = [Select Id,Name from Coctail__c WHERE Ingredient1__c LIKE '%inggredient%'];

        return cocktails;


    }

    @AuraEnabled(cacheable = true)
    public static List<Coctail__c> getExistingCocktailByName(){


    }

}