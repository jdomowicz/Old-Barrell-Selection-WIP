public with sharing class CocktailLWCHandler {


    @AuraEnabled(cacheable = true)
    public static List<Coctail__c> getExisitngCocktails(String searchTerm, String SearchType){
        

    cocktailService cs = new cocktailService();
    

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