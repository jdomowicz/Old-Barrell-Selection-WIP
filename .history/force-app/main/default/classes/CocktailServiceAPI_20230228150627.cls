public with sharing class CocktailServiceAPI implements ICocktailService {

    public List<Coctail__c> getCocktailsbyIngredient(String ingredient){

        CocktailRestServiceHandler c = new CocktailRestServiceHandler();
        List<Coctail__c> clist = c.returnCocktailsFromAPI(ingredient,'Ingredient');

        return clist;

    }

     public List<Coctail__c> getCocktailsbyName(String cocktailName){

          CocktailRestServiceHandler c = new CocktailRestServiceHandler();
        List<Coctail__c> clist = c.returnCocktailsFromAPI(cocktailName,'Name');

        return clist;
     }
}