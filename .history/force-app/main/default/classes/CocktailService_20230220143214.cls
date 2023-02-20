public with sharing class CocktailService {



    public List<Coctail__c> getCocktailsbyIngredient(String inggredient){

         List<Coctail__c> cocktails = new List<Coctail__c>();
        if(String.isEmpty(inggredient)){

        cocktails = [Select Id,Name from Coctail__c Order by Name];
        }
        else{

        String filterVar = inggredient + '%';

        cocktails = [Select Id,Name from Coctail__c WHERE Ingredient1__c LIKE:filterVar OR Ingredient2__c LIKE:filterVar OR Ingredient3__c LIKE:filterVar OR Ingredient4__c LIKE:filterVar OR Ingredient5__c LIKE:filterVar];

        }

        return cocktails;

    }

    public List<Coctail__c> getCocktailsbyName(String cocktailName){

         List<Coctail__c> cocktails = new List<Coctail__c>();
        if(String.isEmpty(inggredient)){

        cocktails = [Select Id,Name from Coctail__c Order by Name];
        }
        else{

        String filterVar = inggredient + '%';

        cocktails = [Select Id,Name from Coctail__c WHERE Name LIKE: filterVar];

        }

        return cocktails;

    }


}