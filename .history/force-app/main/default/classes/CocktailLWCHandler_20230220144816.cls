public with sharing class CocktailLWCHandler {


    @AuraEnabled(cacheable = true)
    public static List<Coctail__c> getExisitngCocktails(String ingredient, String SearchType){
    
    cocktailService cs = new cocktailService();
    
    List<Coctail__c> cocktails = new List<Coctail__c>();

      switch on SearchType{

        when 'Ingredient'{

            retun cs.
        }
        when 'Name'{
            return 
        }
        else{
           return cocktails;
        }

      }



}