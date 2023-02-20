public with sharing class CocktailRestServiceHandler {

    public list<Coctail__c> returnCocktailsFromAPI(String ingredient){


      list<String> fetchDrinkIds = CocktailRestService.getCocktailsByIngr(ingredient);
      list<Coctail__c> CoctailList = new list<Coctail__c>();


      for(String drinkId : fetchDrinkIds){

        CocktailRestService.getCocktailById(drinkId);

      }

        return CoctailList;

    }

}