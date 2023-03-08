import { LightningElement, api } from "lwc";
import { createRecord } from "lightning/uiRecordApi";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import COCKTAIL_OBJECT from "@salesforce/schema/Coctail__c";
import NAME_FIELD from "@salesforce/schema/Coctail__c.Name";

import Ingredient1 from "@salesforce/schema/Coctail__c.Ingredient1__c";
import Ingredient2 from "@salesforce/schema/Coctail__c.Ingredient2__c";
import Ingredient3 from "@salesforce/schema/Coctail__c.Ingredient3__c";
import Ingredient4 from "@salesforce/schema/Coctail__c.Ingredient4__c";
import Ingredient5 from "@salesforce/schema/Coctail__c.Ingredient5__c";

import measure1 from "@salesforce/schema/Coctail__c.Measure1__c";
import measure2 from "@salesforce/schema/Coctail__c.Measure2__c";
import measure3 from "@salesforce/schema/Coctail__c.Measure3__c";
import measure4 from "@salesforce/schema/Coctail__c.Measure4__c";
import measure5 from "@salesforce/schema/Coctail__c.Measure5__c";

import Instructions__c from "@salesforce/schema/Coctail__c.Instructions__c";
import No_Ingredients__c from "@salesforce/schema/Coctail__c.No_Ingredients__c";
import ExternalId from "@salesforce/schema/Coctail__c.Drink_External_Id__c";
import PictureURL__c from "@salesforce/schema/Coctail__c.PictureURL__c";

export default class CocktailTileFromApi extends LightningElement {
  @api cocktail;
  Ing1;
  cocktailId;
  uploadSuccessfull = false;

  handleCreateRecord() {
    this.createCocktail();
  }

  createCocktail() {
    const fields = {};
    fields[NAME_FIELD.fieldApiName] = this.cocktail.Name;
    fields[ExternalId.fieldApiName] = this.cocktail.Drink_External_Id__c;
    fields[Ingredient1.fieldApiName] = this.cocktail.Ingredient1__c;
    fields[Ingredient2.fieldApiName] = this.cocktail.Ingredient2__c;
    fields[Ingredient3.fieldApiName] = this.cocktail.Ingredient3__c;
    fields[Ingredient4.fieldApiName] = this.cocktail.Ingredient4__c;
    fields[Ingredient5.fieldApiName] = this.cocktail.Ingredient5__c;

    fields[measure1.fieldApiName] = this.cocktail.Measure1__c;
    fields[measure2.fieldApiName] = this.cocktail.Measure2__c;
    fields[measure3.fieldApiName] = this.cocktail.Measure3__c;
    fields[measure4.fieldApiName] = this.cocktail.Measure4__c;
    fields[measure5.fieldApiName] = this.cocktail.Measure5__c;

    fields[PictureURL__c.fieldApiName] = this.cocktail.PictureURL__c;
    fields[Instructions__c.fieldApiName] = this.cocktail.Instructions__c;

    const recordInput = { apiName: COCKTAIL_OBJECT.objectApiName, fields };
    createRecord(recordInput)
      .then((cocktail) => {
        this.cocktailId = cocktail.id;
        this.uploadSuccessfull = true;
        console.log(this.uploadSuccessfull);

        this.dispatchEvent(
          new ShowToastEvent({
            title: "Success",
            message: "Cocktail created",
            variant: "success"
          })
        );
      })
      .catch((error) => {
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Error creating record",
            message: error.body.message,
            variant: "error"
          })
        );
      });
  }

  @api
  get isCreateDisabled() {
    const returnValue;
    if(this.uploadSuccessfull === false){
     returnValue = this.cocktail.isExisting__c;
    }
    else{
    returnValue true;
    }

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
