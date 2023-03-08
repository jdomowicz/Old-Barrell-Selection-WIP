public with sharing class CocktailLWCHandler {


  private static final map<String,System.Type> OBJECT_TO_FACTORY = new map<String,System.Type>{

    'Internal' => Type.forName('CocktailService'),
    'API' => Type.forName('CocktailServiceAPI')

  };

  @AuraEnabled(cacheable=true)
  public static List<Coctail__c> getCocktailsData(String SearchTerm,String SearchType, String ObjectType) {

    ICocktailService cs = (ICocktailService)OBJECT_TO_FACTORY.get(ObjectType).newInstance();

    if (!String.isBlank(SearchType)) {
      switch on SearchType {
        when 'Ingredient' {
          dedupedCocktails(cs.getCocktailsbyIngredient(SearchTerm));
          return cs.getCocktailsbyIngredient(SearchTerm);
        }
        when 'Name' {
          dedupedCocktails(cs.getCocktailsbyName(SearchTerm));
          return cs.getCocktailsbyName(SearchTerm);
        }
        when else {
          dedupedCocktails(cs.getCocktailsbyName(SearchTerm));
          return cs.getCocktailsbyName(SearchTerm);
        }
      }
    } else
    {
    dedupedCocktails(cs.getCocktailsbyName(SearchTerm));
      return cs.getCocktailsbyName(SearchTerm);
    }

  }

  public static List<Coctail__c> dedupedCocktails(list<Coctail__c> allCocktails){

    CocktailHelper helper = new CocktailHelper();

    return helper.removeDuplicateDrinks(allCocktails);

     // return dedupedCocktails;

  }

}
