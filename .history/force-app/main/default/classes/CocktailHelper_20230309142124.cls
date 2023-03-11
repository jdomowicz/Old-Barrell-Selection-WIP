public with sharing class CocktailHelper {
  public List<Coctail__c> removeDuplicateDrinks(list<Coctail__c> coctails) {
    List<Coctail__c> dedupedCoctailIds = new List<Coctail__c>();
    List<String> NewExternalIds = returnDrinkExternalIds(coctails);

    list<Coctail__c> existingCocktailsList = [SELECT Id, Name, Drink_External_Id__c
      FROM Coctail__c
      WHERE Drink_External_Id__c IN :NewExternalIds];

    List<String> ExistingExternalIds = returnDrinkExternalIds(existingCocktailsList);

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

}
