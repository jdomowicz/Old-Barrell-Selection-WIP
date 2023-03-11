public with sharing class CocktailLWCHandler {


  private final map<String,Type> queryTypeMap = new map<String,Type>{

    'Internal' => Type.forName('CocktailService'),
    'API' => Type.forName('CocktailServiceAPI')

  };

//@AuraEnabled(cacheable=true)
  public  List<Coctail__c> getExisitngCocktails(String SearchTerm,String SearchType, String queryType) {

    ICocktailService cs = (ICocktailService)queryTypeMap.get(queryType).newInstance();

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
