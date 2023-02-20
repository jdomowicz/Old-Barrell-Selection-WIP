public with sharing class CocktailRestServiceHandler {

    public void returnCocktailsFromAPI(String ingredient){


      list<String> fetchdrinkIds = CocktailRestService.getCocktailsByIngr(ingredient);



    }

}