public interface ICocktailService {

    list<Coctail__c> getCocktailsbyIngredient(String ingredient);

    list<Coctail__c> getCocktailsbyName(String cocktailName);


}