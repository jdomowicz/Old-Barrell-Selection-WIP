import { LightningElement, api,wire} from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

export default class CocktailDetails extends LightningElement {

   @api recordid;


   @wire(getRecord, { recordid: string, fields: string|string[], optionalFields?: string|string[] })
   getRecordDetails;


}