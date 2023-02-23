import { LightningElement, api, wire } from "lwc";
import { getRecord, getFieldValue } from "lightning/uiRecordApi";

import NAMEF from "@salesforce/schema/Coctail__c.Name";
import Ingredient1 from "@salesforce/schema/Coctail__c.Ingredient1__c";
import Ingredient2 from "@salesforce/schema/Coctail__c.Ingredient2__c";
import Ingredient3 from "@salesforce/schema/Coctail__c.Ingredient3__c";
import Ingredient4 from "@salesforce/schema/Coctail__c.Ingredient4__c";
import Ingredient5 from "@salesforce/schema/Coctail__c.Ingredient5__c";

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
  No_Ingredients__c
];
export default class CocktailDetails extends LightningElement {
  @api recordpassed;
  recDetail;
  error;

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
    return getFieldValue(this.recDetail, NAMEF);
  }
  get ing1() {
    return getFieldValue(this.recDetail, Ingredient1);
  }
  get ing2() {
    return getFieldValue(this.recDetail, Ingredient2);
  }
  get ing3() {
    return getFieldValue(this.recDetail, Ingredient3);
  }
  get ing4() {
    return getFieldValue(this.recDetail, Ingredient4);
  }
  get ing5() {
    return getFieldValue(this.recDetail, Ingredient5);
  }
}
