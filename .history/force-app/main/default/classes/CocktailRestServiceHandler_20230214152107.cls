public with sharing class CocktailRestServiceHandler {

    public void returnCocktailsFromAPI(String ingredient){


      list<String> fetchDrinkIds = CocktailRestService.getCocktailsByIngr(ingredient);
      List<Coctail__c> 


      for(String s: fetchDrinkIds){

        CocktailRestService.getCocktailById(fetchDrinkIds);

      }



    }

}