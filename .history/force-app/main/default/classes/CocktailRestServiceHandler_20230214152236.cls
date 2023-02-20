public with sharing class CocktailRestServiceHandler {

    public void returnCocktailsFromAPI(String ingredient){


      list<String> fetchDrinkIds = CocktailRestService.getCocktailsByIngr(ingredient);
      list<Coctail__c> CoctailList = new list<Coctail__c>();


      for(String s: fetchDrinkIds){

        CoctailList.add(CocktailRestService.getCocktailById(fetchDrinkIds);

      }



    }

}