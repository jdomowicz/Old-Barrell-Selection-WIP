public with sharing class CocktailRestServiceHandler {
  public void insertRecepies(list<Coctail__c> Cocktails) {
    List<Cocktail_Ingredients__c> CoctailsIngrUpload = new List<Cocktail_Ingredients__c>();

    Schema.SObjectField externalId = Coctail__c.Fields.Drink_External_Id__c;

    CocktailHelper coctailHelper = new CocktailHelper();
    List<Coctail__c> dedupedCoctails = coctailHelper.removeDuplicateDrinks(
      Cocktails
    );

    /* Perform the upsert. In this case the unique identifier for the
         insert or update decision is the Salesforce record ID. If the
         record ID is null the row will be inserted, otherwise an update
         will be attempted. */

    List<Database.upsertResult> uResults = Database.upsert(
      dedupedCoctails,
      externalId,
      false
    );

    list<Id> insertedIds = new List<Id>();

    for (Database.upsertResult c : uResults) {
      if (c.isSuccess() && c.isCreated()) {
        insertedIds.add(c.getId());
        system.debug(c);
      }
    }

    List<Coctail__c> createdRecordList = [
      SELECT
        Id,
        Name,
        Ingredient1__c,
        Ingredient2__c,
        Ingredient3__c,
        Ingredient4__c,
        Ingredient5__c,
        Measure1__c,
        Measure2__c,
        Measure3__c,
        Measure4__c,
        Measure5__c
      FROM Coctail__c
      WHERE Id IN :insertedIds
    ];

    map<Id, Coctail__c> createdRecordMap = new Map<Id, Coctail__c>(
      createdRecordList
    );

    for (Coctail__c c : createdRecordMap.values()) {
      for (Integer i = 1; i <= 5; i++) {
        if (!String.isBlank((String) c.get('Ingredient' + i + '__c'))) {
          Cocktail_Ingredients__c ci = new Cocktail_Ingredients__c(
            Name = (String) c.get('Ingredient' + i + '__c'),
            Measure__c = (String) c.get('Measure' + i + '__c'),
            Cocktail__c = createdRecordMap.get(c.Id).Id,
            Drink_Ing_External_Id__c = createdRecordMap.get(c.Id).Id +
              (String) c.get('Ingredient' + i + '__c')
          );
          CoctailsIngrUpload.add(ci);
          system.debug(ci);
        }
      }
    }

    Database.SaveResult[] recordDetails = Database.insert(
      CoctailsIngrUpload,
      false
    );
  }

  public list<Coctail__c> returnCocktailsFromAPI(
    String searchString,
    String searchType
  )
  
  
  list<Coctail__c> CoctailList = new List<Coctail__c>();
  {
    switch on searchType {
      when 'Ingredient' {
        list<String> fetchDrinkIds = CocktailRestService.getCocktailsByIngr(
          searchString
        );

        for (String drinkId : fetchDrinkIds) {
          CoctailList.addAll(
            CocktailRestService.getCocktailDetailsbyId(drinkId)
          );
        }
      }
      when 'Name' {
        list<String> fetchDrinkIds = CocktailRestService.getCocktailsByIngr(
          searchString
        );
        list<Coctail__c> CoctailList = new List<Coctail__c>();

        for (String drinkId : fetchDrinkIds) {
          CoctailList.addAll(
            CocktailRestService.getCocktailDetailsbyId(drinkId)
          );
        }
      }
    }

    return CoctailList;
  }
}
