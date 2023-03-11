import { LightningElement, api } from "lwc";
import { createRecord } from 'lightning/uiRecordApi';
import COCKTAIL_OBJECT from '@salesforce/schema/Coctail__c';
import NAME_FIELD from '@salesforce/schema/Coctail__c.Name';

export default class CocktailTileFromApi extends LightningElement {



  @api cocktail;
  Ing1;

  handleCreateRecord(event){

    console.log(event.detail);

  }


  createCocktail(){
    
   const recordInput = { apiName: COCKTAIL_OBJECT.objectApiName, fields };
  }


  get isCreateDisabled(){
    return this.cocktail.isExisting__c;
  }


  get cocktailName() {
    return `${this.cocktail.Name} - ${this.cocktail.Drink_External_Id__c}`;

  }

  get cocktailIng() {
    if (!this.cocktail.Ingredient1__c) {
      return "";
    } else if (!this.cocktail.Measure1__c) {
      return `— ${this.cocktail.Ingredient1__c}`;
    }
    return `— ${this.cocktail.Measure1__c} of ${this.cocktail.Ingredient1__c}`;
  }
  get cocktailIng2() {
    if (!this.cocktail.Ingredient2__c) {
      return "";
    } else if (!this.cocktail.Measure2__c) {
      return `— ${this.cocktail.Ingredient2__c}`;
    }
    return `— ${this.cocktail.Measure2__c} of ${this.cocktail.Ingredient2__c}`;
  }
  get cocktailIng3() {
     if (!this.cocktail.Ingredient3__c) {
      return "";
    } else if (!this.cocktail.Measure3__c) {
      return `— ${this.cocktail.Ingredient3__c}`;
    }
    return `— ${this.cocktail.Measure3__c} of ${this.cocktail.Ingredient3__c}`;
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
