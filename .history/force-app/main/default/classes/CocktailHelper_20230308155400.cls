public with sharing class CocktailHelper {

    public List<Coctail__c> removeDuplicateDrinks(list<Coctail__c> coctails){

        List<Coctail__c> dedupedCoctailIds = new list<Coctail__c>();
        List<String> NewExternalIds = returnDrinkExternalIds(coctails);

        List<Coctail__c> exisitingDrinks = [Select Id,Name,Drink_External_Id__c from Coctail__c where Drink_External_Id__c IN: NewExternalIds];

        List<String> ExistingExternalIds = returnDrinkExternalIds(exisitingDrinks);

       for(Coctail__c c : coctails){

        if(!ExistingExternalIds.contains(c.Drink_External_Id__c)){

            dedupedCoctailIds.add(c);
        }
       }
       return dedupedCoctailIds;
    }


    public list<String> returnDrinkExternalIds(list<Coctail__c> coctails){

        list<String> cocktailExternalIds = new list<String>();

        for(Coctail__c c : coctails){
           cocktailExternalIds.add(c.Drink_External_Id__c);
        }
        return cocktailExternalIds;
    }

    public Boolean checkIfAlredyExisit(cocktail){


    }

}