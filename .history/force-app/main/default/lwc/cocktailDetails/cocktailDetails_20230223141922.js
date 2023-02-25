import { LightningElement, api,wire} from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

import NAME_FIELD from '@salesforce/schema/Coctail__c.Name';
import Ingredient1 from '@salesforce/schema/Coctail__c.Ingredient1__c';
import Ingredient1 from '@salesforce/schema/Coctail__c.Ingredient2__c';
import Ingredient1 from '@salesforce/schema/Coctail__c.Ingredient3__c';
import Ingredient1 from '@salesforce/schema/Coctail__c.Ingredient4__c';
import Ingredient1 from '@salesforce/schema/Coctail__c.Ingredient5__c';

export default class CocktailDetails extends LightningElement {

   @api recordid;


   @wire(getRecord, { recordid: string, fields: string|string[], optionalFields?: string|string[] })
   getRecordDetails;


}