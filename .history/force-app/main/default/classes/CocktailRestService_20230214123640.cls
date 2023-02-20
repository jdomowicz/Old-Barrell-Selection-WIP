public with sharing class CocktailRestService {
  public static void getCocktailById(String CoctailId) {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    String requestBody = '/api/json/v1/1/lookup.php?i=' + CoctailId;
    request.setEndpoint('callout:CocktailDB' + requestBody);
    request.setMethod('GET');
    HttpResponse response = http.send(request);
    // If the request is successful, parse the JSON response.
    if (response.getStatusCode() == 200) {
      CocktailsJSON2APEX cocktailList = CocktailsJSON2APEX.parse(
        response.getBody()
      );

      list<Coctail__c> CoctailsToUpload = new List<Coctail__c>();
      for (CocktailsJSON2APEX.Drink d : cocktailList.drinks) {
        Coctail__c c = new Coctail__c(
          Name = d.strDrink,
          Drink_External_Id__c = d.idDrink,
          PictureURL__c = d.strImageSource,
          Instructions__c = d.strInstructions
        );
        CoctailsToUpload.add(c);
      }
    }
  }

  public static void getCocktailsByIngr(String ingredient) {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    String requestBody = '/api/json/v1/1/filter.php?i=' + ingredient;
    request.setEndpoint('callout:CocktailDB' + requestBody);
    request.setMethod('GET');
    HttpResponse response = http.send(request);

    // I NEED TO PULL COCTAIL BY CoctailsByIngredientsJSON2APEX FIRST AND THEN CocktailsJSON2APEX !!!

    // If the request is successful, parse the JSON response.
    if (response.getStatusCode() == 200) {
      CoctailsByIngredientsJSON2APEX cocktailListbyId = CoctailsByIngredientsJSON2APEX.parse(
        response.getBody()
      );

      for(CoctailsByIngredientsJSON2APEX.Drink d : cocktailListbyId.drink){

        
      }


      list<Coctail__c> CoctailsToUpload = new List<Coctail__c>();
      list<Cocktail_Ingredients__c> CoctailsIngrUpload = new List<Cocktail_Ingredients__c>();

      for (CocktailsJSON2APEX.Drink d : cocktailList.drinks) {

        Coctail__c c = new Coctail__c(
        Name = d.strDrink,
        Drink_External_Id__c = d.idDrink,
        PictureURL__c = d.strImageSource,
        Instructions__c  = d.strInstructions,
        Ingredient1__c = d.strIngredient1,
        Ingredient2__c = d.strIngredient2,
        Ingredient3__c = d.strIngredient3,
        Ingredient4__c = d.strIngredient4,
        Ingredient5__c = d.strIngredient5,
        Measure1__c = d.strMeasure1,
        Measure2__c = d.strMeasure2,
        Measure3__c = d.strMeasure3,
        Measure4__c = d.strMeasure4,
        Measure5__c = d.strMeasure5

        );
        CoctailsToUpload.add(c);

           for(Integer i = 1 ;i <=5; i++){

               if(!String.isBlank((String)c.get('Ingredient'+ i +'__c'))){

				Cocktail_Ingredients__c ci = new Cocktail_Ingredients__c(

				  Name = (String)c.get('Ingredient'+ i +'__c'),
                   Measure__c = (String)c.get('Measure'+ i +'__c'),
                    Cocktail__c = c.Id,
                    Drink_Ing_External_Id__c = c.id + (String)c.get('Ingredient'+ i +'__c')

                );
                    CoctailsIngrUpload.add(ci);
               }
        }

    }

    upsert CoctailsToUpload Drink_External_Id__c;
    upsert CoctailsIngrUpload Drink_Ing_External_Id__c;
  }


}
}
