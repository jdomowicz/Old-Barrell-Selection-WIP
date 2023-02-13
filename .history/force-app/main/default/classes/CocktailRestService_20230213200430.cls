public with sharing class CocktailRestService {


    public static void getCocktailByName(String CoctailName) {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    String requestBody = '/api/json/v1/1/search.php?s='+ CoctailName;
    request.setEndpoint(
      'callout:CocktailDB' + requestBody
    );
    request.setMethod('GET');
    HttpResponse response = http.send(request);
    // If the request is successful, parse the JSON response.
    if (response.getStatusCode() == 200) {
      CocktailsJSON2APEX cocktailList = CocktailsJSON2APEX.parse(
        response.getBody()
      );

      system.debug(cocktailList);

      for(CocktailsJSON2APEX.Drink d : cocktailList.drinks) {
        system.debug(d);
      }
    }
  }


    public static void getCocktailsByIngr(String ingredient) {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    String requestBody = '/api/json/v1/1/search.php?i='+ ingredient;
    request.setEndpoint(
      'callout:CocktailDB' + requestBody
    );
    request.setMethod('GET');
    HttpResponse response = http.send(request);
    // If the request is successful, parse the JSON response.
    if (response.getStatusCode() == 200) {
      CoctailsByIngredientsJSON2APEX cocktailList = CoctailsByIngredientsJSON2APEX.parse(
        response.getBody()
      );

      List<Id> drinkIds = new list<Id>();

      for(CoctailsByIngredientsJSON2APEX.Drink d : cocktailList.drinks){

        drinkIds.add(d.idDrink);

      }

      list<Id> existingRecord = new list<Id>();
      
      
      [SELECT Drink_External_Id__c from Coctail__c WHERE Drink_External_Id__c IN:drinkIds];

      for(CoctailsByIngredientsJSON2APEX.Drink d : cocktailList.drinks){

        if(existingRecord.contains(d.idDrink)){

          system.debug(d);
        }

     }


    }
  }

}
