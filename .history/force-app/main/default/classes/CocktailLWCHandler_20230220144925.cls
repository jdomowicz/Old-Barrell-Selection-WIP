public with sharing class CocktailLWCHandler {


    @AuraEnabled(cacheable = true)
    public static List<Coctail__c> getExisitngCocktails(String searchTerm, String SearchType){
    
    cocktailService cs = new cocktailService();
    List<Coctail__c> cocktails = new List<Coctail__c>();

      switch on SearchType{

        when 'Ingredient' {

            retun cs.getExisitngCocktails(searchTerm);
        }
        when 'Name' {
            return retun cs.getExisitngCocktails(searchTerm);
        }
        when else {
           return cocktails;
        }

      }
    }

}