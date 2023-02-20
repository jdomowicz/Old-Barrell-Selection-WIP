public with sharing class CocktailRestServiceHandler {

    public void insertRecepies(list<Coctail__c> Cocktails) {

    List<Cocktail_Ingredients__c> CoctailsIngrUpload = new List<Cocktail_Ingredients__c>();

    

    for (Coctail__c c : Cocktails) {

      for (Integer i = 1; i <= 5; i++) {
        if (!String.isBlank((String) c.get('Ingredient' + i + '__c'))) {
          Cocktail_Ingredients__c ci = new Cocktail_Ingredients__c(
            Name = (String) c.get('Ingredient' + i + '__c'),
            Measure__c = (String) c.get('Measure' + i + '__c'),
            Cocktail__c = c.Id,
            Drink_Ing_External_Id__c = c.id +
              (String) c.get('Ingredient' + i + '__c')
          );
          CoctailsIngrUpload.add(ci);
        }
      }
    }
  }



  private list<Coctail__c> returnCocktailsFromAPI(String ingredient) {
    list<String> fetchDrinkIds = CocktailRestService.getCocktailsByIngr(
      ingredient
    );
    list<Coctail__c> CoctailList = new List<Coctail__c>();

    for (String drinkId : fetchDrinkIds) {
      CoctailList.addAll(CocktailRestService.getCocktailById(drinkId));
    }

    return CoctailList;
  }
}
