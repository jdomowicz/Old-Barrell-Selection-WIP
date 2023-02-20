trigger CocktailTrigger on Coctail__c (before update) {


    switch on operationType {
    when BEFORE_UPDATE {
    }
  }

}
