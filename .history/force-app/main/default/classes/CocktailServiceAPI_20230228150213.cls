public with sharing class CocktailServiceAPI implements ICocktailService {

    public List<Coctail__c> getCocktailsbyIngredient(String ingredient){

        CocktailRestServiceHandler c = new CocktailRestServiceHandler();
        
        List<Coctail__c> clist = c.returnCocktailsFromAPI(searchString,searchType);
        return clist;

    }


     public List<Coctail__c> getCocktailsbyName(String cocktailName){

         return new list<Coctail__c>();
     }
}