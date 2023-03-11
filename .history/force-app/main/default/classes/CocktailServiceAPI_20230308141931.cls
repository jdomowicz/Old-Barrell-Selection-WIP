public with sharing class CocktailServiceAPI implements ICocktailService {

    public List<Coctail__c> getCocktailsbyIngredient(String ingredient){

        CocktailRestServiceHandler c = new CocktailRestServiceHandler();
        List<Coctail__c> clist = c.returnCocktailsbyIng(ingredient);

        return clist;

    }

     public List<Coctail__c> getCocktailsbyName(String cocktailName){

          CocktailRestServiceHandler c = new CocktailRestServiceHandler();

          if(!cocktailName.isBlank()){
        List<Coctail__c> clist = c.returnCocktailsbyName(cocktailName);
          }
          

        return clist;
     }
}