import { LightningElement, api } from "lwc";

export default class CocktailTileFromApi extends LightningElement {
  @api cocktail;
  Ing1;

  get cocktailIng() {
    if (!this.cocktail.Ingredient1__c) {
      return "";
    }
    return `— ${this.cocktail.Ingredient1__c}`;
  }
  get cocktailIng2() {
    if (!this.cocktail.Ingredient2__c) {
      return ;
    }
    return `— ${this.cocktail.Ingredient2__c}`;
  }
  get cocktailIng3() {
    if (!this.cocktail.Ingredient3__c) {
      return "";
    }
    return `— ${this.cocktail.Ingredient3__c}`;
  }
  get cocktailIng4() {
    if (!this.cocktail.Ingredient4__c) {
      return "";
    }
    return `— ${this.cocktail.Ingredient4__c}`;
  }
  get cocktailIng5() {
    if (!this.cocktail.Ingredient5__c) {
      return "";
    }
    return `— ${this.cocktail.Ingredient5__c}`;
  }
}
