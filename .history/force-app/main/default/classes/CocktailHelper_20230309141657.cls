public with sharing class CocktailHelper {
  public List<Coctail__c> removeDuplicateDrinks(list<Coctail__c> coctails) {
    List<Coctail__c> dedupedCoctailIds = new List<Coctail__c>();
    List<String> NewExternalIds = returnDrinkExternalIds(coctails);

    List<String> ExistingExternalIds = returnDrinkExternalIds([
      SELECT Id, Name, Drink_External_Id__c
      FROM Coctail__c
      WHERE Drink_External_Id__c IN :NewExternalIds
    ]);

    for (Coctail__c c : coctails) {
      if (!ExistingExternalIds.contains(c.Drink_External_Id__c)) {
        dedupedCoctailIds.add(c);
      }
    }
    return dedupedCoctailIds;
  }

  public list<String> returnDrinkExternalIds(list<Coctail__c> coctails) {
    list<String> cocktailExternalIds = new List<String>();

    for (Coctail__c c : coctails) {
      cocktailExternalIds.add(c.Drink_External_Id__c);
    }
    return cocktailExternalIds;
  }

  public map<String,Id> returnMapExistingRecExtIdWithSfId(list<Coctail__c> coctails){
    map<String,Id> recordsWithIds = new map<String,Id>();

    for(Coctail__c c :coctails){
      recordsWithIds.put(c.Drink_External_Id__c,c.Id);
    }
    return recordsWithIds;
  }

  public list<Coctail__c> adIsRecepieExistingFlag(list<coctail__c> coctails) {
    List<Coctail__c> enrichedCocktails = new List<Coctail__c>();
    List<String> NewExternalIds = returnDrinkExternalIds(coctails);

    existingCocktailsList = [SELECT Id, Name, Drink_External_Id__c
      FROM Coctail__c
      WHERE Drink_External_Id__c IN :NewExternalIds];

    List<String> ExistingExternalIds = returnDrinkExternalIds([
      SELECT Id, Name, Drink_External_Id__c
      FROM Coctail__c
      WHERE Drink_External_Id__c IN :NewExternalIds
    ]);

    map<String,Id> extIdWithSfId = returnMapExistingRecExtIdWithSfId();

    for (Coctail__c c : coctails) {
      if (ExistingExternalIds.contains(c.Drink_External_Id__c)) {
        c.isExisting__c = true;
      }
      else c.isExisting__c = false;

      enrichedCocktails.add(c);
    }

    return enrichedCocktails;
  }
}
