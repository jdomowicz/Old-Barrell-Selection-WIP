public with sharing class CocktailLWCHandler {


    @AuraEnabled(cacheable = true)
    public static List<Coctail__c> getExisitngCocktails(String ingredient, String SearchType){
    
        List<Coctail__c> cocktails = List<Coctail__c>()

      switch on SearchType{

        when ''
      }



}