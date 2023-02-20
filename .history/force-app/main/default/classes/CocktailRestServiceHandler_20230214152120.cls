public with sharing class CocktailRestServiceHandler {

    public void returnCocktailsFromAPI(String ingredient){


      list<String> fetchDrinkIds = CocktailRestService.getCocktailsByIngr(ingredient);
      list<Coctail__c> CoctailList


      for(String s: fetchDrinkIds){

        CocktailRestService.getCocktailById(fetchDrinkIds);

      }



    }

}