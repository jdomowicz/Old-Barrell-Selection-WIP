public with sharing class CocktailTriggerHandler {

 public static void beforeUpdateRemoveDuplicate(list<Coctail__c> newList,map<Id, Coctail__c> oldContactsMap) {
    for (Coctail__c c : newList) {
      if (c.PictureURL__c == oldContactsMap.get(c.id).PictureURL__c && c.No_Ingredients__c == oldContactsMap.get(c.id).No_Ingredients__c) {
        c.AddError('This record has not changed');
      }
    }
  }
}