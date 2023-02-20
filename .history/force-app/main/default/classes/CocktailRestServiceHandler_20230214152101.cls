public with sharing class CocktailRestServiceHandler {

    public void returnCocktailsFromAPI(String ingredient){


      list<String> fetchDrinkIds = CocktailRestService.getCocktailsByIngr(ingredient);
      List<Cocta


      for(String s: fetchDrinkIds){

        CocktailRestService.getCocktailById(fetchDrinkIds);

      }



    }

}