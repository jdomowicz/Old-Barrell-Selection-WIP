public with sharing class CocktailController {

    public List<Coctail__c> removeDuplicateDrinks(list<Coctail__c> coctails){

        

        List<Coctail__c> drinks = [Select Id,Name,Drink_External_Id__c from Coctail__c where Drink_External_Id__c IN: returnDrinkExternalIds(coctails)];

       for(Coctail__c c : coctails){

        if(drinks.contains()){

            system.debug('duplicate' + c.Id);
        }
       }

    }


    public list<String> returnDrinkExternalIds(list<Coctail__c> coctails){

        list<String> cocktailExternalIds = new list<String>();

        for(Coctail__c c : coctails){
           cocktailExternalIds.add(c.drinkExternalIds);

        }

        return cocktailExternalIds;


    }

}