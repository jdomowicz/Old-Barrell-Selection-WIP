public with sharing class CocktailLWCHandler {

    


    @AuraEnabled(cacheable = true)
    public static List<Coctail__c> getExisitngCocktails(String ingredient, String SearchType){

      CocktailService  cocktailList = new CocktailService();
     return cocktailList.getCocktailsbyIngredient(ingredient);

    }



}