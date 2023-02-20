public with sharing class CocktailLWCHandler {


    @AuraEnabled(cacheable = true)
    public static List<Coctail__c> getExisitngCocktails(String searchTerm, String SearchType){

    List<Coctail__c> cocktails = new List<Coctail__c>();
    cocktailService cs = new cocktailService();

    if(String.isBlank(searchTerm) )

      switch on SearchType{

        when 'Ingredient' {

            return cs.getCocktailsbyIngredient(searchTerm);
        }
        when 'Name' {
            return cs.getCocktailsbyName(searchTerm);
        }
        when else {
           return cocktails;
        }

      }
    }

}