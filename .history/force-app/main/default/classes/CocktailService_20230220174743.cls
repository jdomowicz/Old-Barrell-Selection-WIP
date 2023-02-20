public with sharing class CocktailService {



    public List<Coctail__c> getCocktailsbyIngredient(String ingredient){

         List<Coctail__c> cocktails = new List<Coctail__c>();
        if(String.isEmpty(ingredient)){

        cocktails = [Select Id,Name,PictureURL__c,Ingredient1__c,Ingredient2__c,Ingredient3,Ingredient4,Ingredient5  from Coctail__c Order by Name];
        }
        else{

        String filterVar = ingredient + '%';

        cocktails = [Select Id,Name,PictureURL__c ,Ingredient1__c,Ingredient2__c,Ingredient3,Ingredient4,Ingredient5 from Coctail__c WHERE Ingredient1__c LIKE:filterVar OR Ingredient2__c LIKE:filterVar OR Ingredient3__c LIKE:filterVar OR Ingredient4__c LIKE:filterVar OR Ingredient5__c LIKE:filterVar];

        }

        return cocktails;

    }

    public List<Coctail__c> getCocktailsbyName(String cocktailName){

         List<Coctail__c> cocktails = new List<Coctail__c>();
        if(String.isEmpty(cocktailName)){

        cocktails = [Select Id,PictureURL__c ,Name ,Ingredient1__c,Ingredient2__c,Ingredient3__c,Ingredient4__c,Ingredient5 from Coctail__c Order by Name];
        }
        else{

        String filterVar = cocktailName + '%';

        cocktails = [Select Id,Name,PictureURL__c ,Ingredient1__c,Ingredient2__c,Ingredient3,Ingredient4,Ingredient5 from Coctail__c WHERE Name LIKE: filterVar];

        }

        return cocktails;

    }


}