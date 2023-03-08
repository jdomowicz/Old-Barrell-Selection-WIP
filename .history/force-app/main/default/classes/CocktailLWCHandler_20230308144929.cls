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

          return cs.getCocktailsbyIngredient(SearchTerm);
        }
        when 'Name' {

          return cs.getCocktailsbyName(SearchTerm);
        }
        when else {

          return cs.getCocktailsbyName(SearchTerm);
        }
      }
    } else
    {
      return cs.getCocktailsbyName(SearchTerm);
    }

  }

}
