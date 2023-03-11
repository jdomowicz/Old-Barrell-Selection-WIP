public interface ICocktailService {

    list<Coctail__c> getCocktailsbyIngredient(String );

    list<Coctail__c> getCocktailsbyName();


}