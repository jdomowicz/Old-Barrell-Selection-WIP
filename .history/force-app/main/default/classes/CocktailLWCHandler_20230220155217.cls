public with sharing class CocktailLWCHandler {

@AuraEnabled(cacheable=true)
  public static List<Coctail__c> getExisitngCocktails(String SearchTerm,String SearchType) {

    cocktailService cs = new cocktailService();

    if (!String.isBlank(SearchType)) {
      switch on SearchType {
        when 'Ingredient' {
          return cs.getCocktailsbyIngredient(searchTerm);
        }
        when 'Name' {
          return cs.getCocktailsbyName(searchTerm);
        }
        when else {
          return cs.getCocktailsbyName(searchTerm);
        }
      }
    } else {
      return cs.getCocktailsbyName(searchTerm);
    }
  }
}
