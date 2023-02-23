import { LightningElement, api} from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

export default class CocktailDetails extends LightningElement {

   @api recordid;


   @wire(getRecord, { recordId: string, fields: string|string[], optionalFields?: string|string[] })
propertyOrFunction


}