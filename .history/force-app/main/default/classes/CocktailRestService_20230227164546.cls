public with sharing class CocktailRestService {
  // Fetch drink Details from external API

  public static list<Coctail__c> getCocktailDetailsbyId(String CoctailId) {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    String requestBody = '/api/json/v1/1/lookup.php?i=' + CoctailId;
    request.setEndpoint('callout:CocktailDB' + requestBody);
    request.setMethod('GET');
    HttpResponse response = http.send(request);
    list<Coctail__c> CoctailsToUpload = new List<Coctail__c>();
    // If the request is successful, parse the JSON response.
    if (response.getStatusCode() == 200) {
      CocktailsJSON2APEX cocktailList = CocktailsJSON2APEX.parse(
        response.getBody()
      );

      for (CocktailsJSON2APEX.Drink d : cocktailList.drinks) {
        Coctail__c c = new Coctail__c(
          Name = d.strDrink,
          Drink_External_Id__c = d.idDrink,
          PictureURL__c = d.strDrinkThumb,
          Instructions__c = d.strInstructions,
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
      }
    }

    return CoctailsToUpload;
  }

  // Fetch list of drinks with specific ingredenits from external API

  public static list<String> getCocktailsByIngr(String ingredient) {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    String requestBody = '/api/json/v1/1/filter.php?i=' + ingredient;
    request.setEndpoint('callout:CocktailDB' + requestBody);
    request.setMethod('GET');
    HttpResponse response = http.send(request);

    list<String> DrinkIds = new List<String>();

    if (response.getStatusCode() == 200) {
      CoctailsByIngredientsJSON2APEX cocktailList = CoctailsByIngredientsJSON2APEX.parse(
        response.getBody()
      );

      for (CoctailsByIngredientsJSON2APEX.Drink d : cocktailList.drinks) {
        DrinkIds.add(d.IdDrink);
      }
    }
    return DrinkIds;
  }

  public static list<Coctail__c> getCocktailsByName(String cocktailName) {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    String requestBody = '/api/json/v1/1/search.php?i=' + cocktailName;
    request.setEndpoint('callout:CocktailDB' + requestBody);
    request.setMethod('GET');
    HttpResponse response = http.send(request);

    list<Coctail__c> CoctailsToUpload = new List<Coctail__c>();



    }

}
