public interface ICocktailService {

    list<Coctail__c> getCocktailsbyIngredient();

    list<Coctail__c> getCocktailsbyName();


}