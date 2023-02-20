public with sharing class CocktailLWCHandler {


    @AuraEnabled(cacheable = true)
    public static List<Coctail__c> getExisitngCocktails(String inggredient, String SearchType){

      CocktailService  cocktailList = new CocktailService();
     return cocktailList.getCocktailsbyIngredient(inggredient);

    }



}