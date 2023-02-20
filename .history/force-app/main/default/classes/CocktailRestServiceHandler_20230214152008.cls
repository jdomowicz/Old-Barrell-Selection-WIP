public with sharing class CocktailRestServiceHandler {

    public void returnCocktailsFromAPI(String ingredient){


      list<String> drinkIds = CocktailRestService.getCocktailsByIngr(ingredient);



    }

}