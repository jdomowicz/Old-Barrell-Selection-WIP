public with sharing class CocktailController {

    public List<Coctail__c> removeDuplicateDrinks(list<Coctail__c> coctails){

        list<Coctail__c> dedupedContacts = new List<Coctail__c>();

        map<Id,Coctail__c> cMap = new map<Id,Coctail__c>(drinkExternalIds);

        List<Coctail__c> drinks = [Select Id,Name,Drink_External_Id__c from Coctail__c where Drink_External_Id__c IN: drinkExternalIds];

       for(Coctail__c c : cMap.values()){

        if(!cMap.containsKey(c.Id)){

            system.debug('duplicate' + c.Id);
        }
       }

    }


    public list<String> returnDrinkExternalIds(list<Coctail__c> coctails){

        return for(Coctail__c c :)



    }

}