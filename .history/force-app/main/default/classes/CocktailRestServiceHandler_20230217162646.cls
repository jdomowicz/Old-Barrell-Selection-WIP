public with sharing class CocktailRestServiceHandler {

    public void insertRecepies(list<Coctail__c> Cocktails) {

    List<Cocktail_Ingredients__c> CoctailsIngrUpload = new List<Cocktail_Ingredients__c>();

    //CocktailHelper coctailWrapper = new CocktailHelper();

    Schema.SObjectField externalId = Coctail__c.Fields.Drink_External_Id__c;

    //List<Coctail__c> dedupedCoctails =  coctailWrapper.removeDuplicateDrinks(Cocktails);

    //try{


      /* Perform the upsert. In this case the unique identifier for the
         insert or update decision is the Salesforce record ID. If the
         record ID is null the row will be inserted, otherwise an update
         will be attempted. */

      List<Database.upsertResult> uResults = Database.upsert(Cocktails,externalId,false);
      //upsert Cocktails Drink_External_Id__c;
    //}
    //catch(DmlException e){
     // System.debug('The following exception has occurred: ' + e.getMessage());
   // }

   list<Id> insertedIds = new list<Id>();

   for(Database.upsertResult c : uResults){
    if (c.isSuccess() && c.isCreated()){
      insertedIds.add(getId());
    }
   }

   List<Coctail__c> createdRecordList = [SELECT Id,Name,Ingredient1__c,Ingredient2__c,Ingredient3__c,Ingredient4__c,Ingredient5__c,
   Measure1__c,Measure2__c,Measure3__c,Measure4__c,Measure5__c,Cocktail__c FROM Coctail__c WHERE Id IN:insertedIds];

   map<Id,Coctail__c> createdRecordMap = new map<Id,Coctail__c>(createdRecordList);



    for (Coctail__c c : uResults) {

      for (Integer i = 1; i <= 5; i++) {
        if (!String.isBlank((String) createdRecordMap.get('Ingredient' + i + '__c'))) {
          Cocktail_Ingredients__c ci = new Cocktail_Ingredients__c(
            Name = (String) c.get('Ingredient' + i + '__c'),
            Measure__c = (String) c.get('Measure' + i + '__c'),
            Cocktail__c = c.Id,
            Drink_Ing_External_Id__c = c.getId() +
              (String) c.get('Ingredient' + i + '__c')
          );
          CoctailsIngrUpload.add(ci);
        }
      }
    
    }


    upsert CoctailsIngrUpload Drink_Ing_External_Id__c;
  }

  public list<Coctail__c> returnCocktailsFromAPI(String ingredient) {
    list<String> fetchDrinkIds = CocktailRestService.getCocktailsByIngr(
      ingredient
    );
    list<Coctail__c> CoctailList = new List<Coctail__c>();

    for (String drinkId : fetchDrinkIds) {
      CoctailList.addAll(CocktailRestService.getCocktailDetailsbyId(drinkId));
    }

    return CoctailList;
  }
}
