trigger CocktailTrigger on Cocktail__c(before insert) {
  
  
    switch on operationType {
    when BEFORE_INSERT {
    }
  }

}
