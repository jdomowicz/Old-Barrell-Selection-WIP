import { LightningElement, api,wire} from 'lwc';
import { getRecord,getFieldValue  } from 'lightning/uiRecordApi';

import NAME_FIELD from '@salesforce/schema/Coctail__c.Name';
import Ingredient1 from '@salesforce/schema/Coctail__c.Ingredient1__c';
import Ingredient2 from '@salesforce/schema/Coctail__c.Ingredient2__c';
import Ingredient3 from '@salesforce/schema/Coctail__c.Ingredient3__c';
import Ingredient4 from '@salesforce/schema/Coctail__c.Ingredient4__c';
import Ingredient5 from '@salesforce/schema/Coctail__c.Ingredient5__c';

import Instructions__c from '@salesforce/schema/Coctail__c.Instructions__c';
import No_Ingredients__c from '@salesforce/schema/Coctail__c.No_Ingredients__c';

export default class CocktailDetails extends LightningElement {

   @api recordid;


   @wire(getRecord, { recordid: '$recordid', fields:[NAME_FIELD],
optionalFields: [Ingredient1,Ingredient2,Ingredient3,Ingredient4,Ingredient5,Instructions__c,No_Ingredients__c]
})
   getRecordDetails;



   get name() {
        return getFieldValue(this.getRecordDetails.data, NAME_FIELD);
    }

   get ing1() {
        return getFieldValue(this.getRecordDetails.data, Ingredient1);
    }
      get ing2() {
        return getFieldValue(this.getRecordDetails.data, Ingredient2);
    }
      get ing3() {
        return getFieldValue(this.getRecordDetails.data, Ingredient3);
    }
      get ing4() {
        return getFieldValue(this.getRecordDetails.data, Ingredient4);
    }
      get Ingredient5() {
        return getFieldValue(this.getRecordDetails.data, Ingredient5);
    }



}