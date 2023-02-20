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


      list<Coctail__c> CoctailsToUpload = new list<Coctail__c>();
      for (CocktailsJSON2APEX.Drink d : cocktailList.drinks) {

        record.getPopulatedFieldsAsMap().values()

        Coctail__c c = new Coctail__c(

        Name = d.strDrink,
        Drink_External_Id__c = d.idDrink,
        PictureURL__c = d.strImageSource,
        Instructions__c  = d.strInstructions
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
      List<String> drinkIds = new List<String>();
      list<String> existingRecordIds = new List<String>();
      list<String> dedupedDrinkIds = new List<String>();

      for (CoctailsByIngredientsJSON2APEX.Drink d : cocktailList.drinks) {
        drinkIds.add(d.idDrink);
      }

      for (Coctail__c c : [
        SELECT Drink_External_Id__c
        FROM Coctail__c
        WHERE Drink_External_Id__c IN :drinkIds
      ]) {
        existingRecordIds.add(c.Drink_External_Id__c);
      }
      for (CoctailsByIngredientsJSON2APEX.Drink d : cocktailList.drinks) {

          if (!existingRecordIds.contains(d.idDrink)) {
          dedupedDrinkIds.add(d.idDrink);
        }
      }

    }
  }
}
