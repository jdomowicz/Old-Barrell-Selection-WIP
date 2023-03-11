public with sharing class CocktailServiceAPI implements ICocktailService {

    public List<Coctail__c> getCocktailsbyIngredient(String ingredient){

        CocktailRestServiceHandler c = new CocktailRestServiceHandler(ingredient,'Ingredient');
        List<Coctail__c> clist = c.returnCocktailsFromAPI(searchString,'Ingredient');

        return clist;

    }

     public List<Coctail__c> getCocktailsbyName(String cocktailName){

          CocktailRestServiceHandler c = new CocktailRestServiceHandler(cocktailName,'Name');
        List<Coctail__c> clist = c.returnCocktailsFromAPI(cocktailName,'Name');

        return clist;
     }
}