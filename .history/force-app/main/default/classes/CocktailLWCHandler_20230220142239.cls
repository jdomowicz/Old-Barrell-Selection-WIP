public with sharing class CocktailLWCHandler {


    @AuraEnabled(cacheable = true)
    public static List<Coctail__c> getExisitngCocktailByIngredient(String inggredient){

        List<Coctail__c> cocktails = new List<Coctail__c>();
        if(String.isEmpty(inggredient)){

        cocktails = [Select Id,Name from Coctail__c Order by Name];
        }
        else{

        String filterVar = inggredient + '%';

        cocktails = [Select Id,Name from Coctail__c WHERE Ingredient1__c LIKE:filterVar OR Ingredient2__c LIKE:filterVar || Ingredient3__c LIKE:filterVar || Ingredient4__c LIKE:filterVar OR || Ingredient5__c LIKE:filterVar];

        }

        return cocktails;


    }

    @AuraEnabled(cacheable = true)
    public static List<Coctail__c> getExistingCocktailByName(){


    }

}