import { LightningElement, api ,wire} from "lwc";
import { getRecord, getFieldValue } from "lightning/uiRecordApi";

export default class CocktailTileFromApi extends LightningElement {
  @api cocktail;
  Ing1;
  isCreateDisabled = true;

  handleCreateRecord(event){

  }

    @wire(getRecord, {
    recordId: "$recordpassed",
    fields: fields
  })
  fetchRecDetail({ data, error }) {
    if (data) {
      console.log(data);
      this.recDetail = data;
    } else if (error) {
      console.log(error);
      this.error = error;
    }
  }


  get cocktailName() {
    return `${this.cocktail.Name} - ${this.cocktail.Drink_External_Id__c}`

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
