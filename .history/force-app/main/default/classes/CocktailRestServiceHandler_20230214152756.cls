public with sharing class CocktailRestServiceHandler {

    public list<Coctail__c> returnCocktailsFromAPI(String ingredient){


      list<String> fetchDrinkIds = CocktailRestService.getCocktailsByIngr(ingredient);
      list<Coctail__c> CoctailList = new list<Coctail__c>();


      for(String s: fetchDrinkIds){

        CoctailList.addAll(CocktailRestService.getCocktailById(fetchDrinkIds));

      }

        return CoctailList;

    }

}