public with sharing class CocktailRestServiceHandler {



    public void insertRecepies(list<Coctail__c> Cocktails){

        for(Coctail__c c : Cocktails){

            for()

        }


    }





    private list<Coctail__c> returnCocktailsFromAPI(String ingredient){


      list<String> fetchDrinkIds = CocktailRestService.getCocktailsByIngr(ingredient);
      list<Coctail__c> CoctailList = new list<Coctail__c>();


      for(String drinkId : fetchDrinkIds){

       CoctailList.addAll(CocktailRestService.getCocktailById(drinkId));

      }

        return CoctailList;

    }

}