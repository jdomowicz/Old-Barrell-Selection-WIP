public with sharing class CocktailRestServiceHandler {

    public void returnCocktailsFromAPI(String ingredient){


       
        CocktailRestService.getCocktailsByIngr(ingredient);



    }

}