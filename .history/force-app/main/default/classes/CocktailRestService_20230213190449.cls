public with sharing class CocktailRestService {


    public static void getCocktalByName(String Ingredients) {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    String requestBody = 'filter.php?i'+ ;
    request.setEndpoint(
      'callout:CocktailDB/'
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
}
