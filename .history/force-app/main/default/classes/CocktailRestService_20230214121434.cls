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
    // If the request is successful, parse the JSON response.
    if (response.getStatusCode() == 200) {
      CoctailsByIngredientsJSON2APEX cocktailList = CoctailsByIngredientsJSON2APEX.parse(
        response.getBody()
      );
      list<Coctail__c> CoctailsToUpload = new List<Coctail__c>();
      list<Cocktail_Ingredients__c> CoctailsIngrUpload = new List<Cocktail_Ingredients__c>();



    }
  }
}
