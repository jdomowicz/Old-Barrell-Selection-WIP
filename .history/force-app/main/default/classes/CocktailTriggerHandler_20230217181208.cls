public with sharing class CocktailTriggerHandler {

 public static void beforeUpdateRemoveDuplicate(list<Coctail__c> newList,map<Id, Coctail__c> oldContactsMap) {
    for (Coctail__c c : newList) {
      if (c.PictureURL__c == oldContactsMap.get(c.id).PictureURL__c) {
        c.AddError('Drink URL has not changed');
      }
    }
  }
}


trigger UpdateTriggerSample_tgr on Lead (after update) { Lead NewLead = trigger.new[0]; Lead OldLead = trigger.old[0]; Lead LeadObject = new Lead(); // This takes all available fields from the required object.
     Schema.SObjectType objType = Coctail__c.getSObjectType();
     
     Map<String, Schema.SObjectField> M = Schema.SObjectType.Coctail__c.fields.getMap();
     
     for (String str : M.keyset()) { try { System.debug('Field name: '+str +'. New value: ' + NewLead.get(str) +'. Old value: '+OldLead.get(str)); if(NewLead.get(str) != OldLead.get(str)){ system.debug('******The value has changed!!!! '); // here goes more code } } catch (Exception e) { System.debug('Error: ' + e); } } }