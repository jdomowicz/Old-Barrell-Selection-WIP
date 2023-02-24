import { LightningElement, api, wire } from "lwc";
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import { NavigationMixin } from 'lightning/navigation';

import NAMEF from "@salesforce/schema/Coctail__c.Name";
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
const fields = [
  NAMEF,
  Ingredient1,
  Ingredient2,
  Ingredient3,
  Ingredient4,
  Ingredient5,
  Instructions__c,
  No_Ingredients__c,
  measure1,
  measure2,
  measure3,
  measure4,
  measure5
];
export default class CocktailDetails extends NavigationMixin(LightningElement) {
  @api recordpassed;
  recDetail;
  error;
  _name;

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

  get name() {
    return this.uperCase(getFieldValue(this.recDetail, NAMEF));
  }

  get ing1() {
    return this.concatIngr(
      getFieldValue(this.recDetail, measure1),
      getFieldValue(this.recDetail, Ingredient1)
    );
  }

  get ing2() {
    return this.concatIngr(
      getFieldValue(this.recDetail, measure2),
      getFieldValue(this.recDetail, Ingredient2)
    );
  }
  get ing3() {
    return this.concatIngr(
      getFieldValue(this.recDetail, measure3),
      getFieldValue(this.recDetail, Ingredient3)
    );
  }

  get ing4() {
    return this.concatIngr(
      getFieldValue(this.recDetail, measure4),
      getFieldValue(this.recDetail, Ingredient4)
    );
  }
  get ing5() {
    return this.concatIngr(
        getFieldValue(this.recDetail, measure5),
        getFieldValue(this.recDetail, Ingredient5)
      );
  }

  get description() {
    return getFieldValue(this.recDetail, Instructions__c);
  }

  concatIngr = (arg1, arg2) => {
    let ing;

    if (arg1 === null || arg1 === "" || arg1 === undefined) {
      ing = "";
    } else {
      ing = arg1 + " of " + arg2;
    }
    return ing;
  };

  /*
  uperCase = (arg1) => {
    const ing = arg1.toUpperCase();
    return ing;
  };

  handleEditRecord(){
    this.navigateToRecordViewPage('edit');
  }
   handleViewRecord(){
    this.navigateToRecordViewPage('view');
  }

   navigateToRecordViewPage(vietype) {
        // View a custom object record.
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordpassed,
                objectApiName: 'Coctail__c',
                actionName: vietype
            }
        });
    }

}
