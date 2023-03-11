public with sharing class CocktailLWCHandler {

@AuraEnabled(cacheable=true)
  public static List<Coctail__c> getExisitngCocktails(String SearchTerm,String SearchType, LayoutType) {

    cocktailService cs = new cocktailService();

    if (!String.isBlank(SearchType)) {
      switch on SearchType {
        when 'Ingredient' {
          return cs.getCocktailsbyIngredient(SearchTerm);
        }
        when 'Name' {
          return cs.getCocktailsbyName(SearchTerm);
        }
        when else {
          return cs.getCocktailsbyName(SearchTerm);
        }
      }
    } else {
      return cs.getCocktailsbyName(SearchTerm);
    }
  }
}
