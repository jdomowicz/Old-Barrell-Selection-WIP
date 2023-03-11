public with sharing class CocktailServiceAPI implements ICocktailService {

    public List<Coctail__c> getCocktailsbyIngredient(String ingredient){

       
       
        CocktailRestService.returnCocktailsFromAPI(String searchString,String searchType);
        return new list<Coctail__c>();

    }


     public List<Coctail__c> getCocktailsbyName(String cocktailName){

         return new list<Coctail__c>();
     }
}