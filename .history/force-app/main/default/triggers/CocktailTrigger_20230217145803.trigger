trigger CocktailTrigger on Coctail__c (before insert) {


    switch on operationType {
    when BEFORE_UPDATE {
    }
  }

}
