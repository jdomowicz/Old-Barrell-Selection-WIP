import { LightningElement,api } from 'lwc';

export default class CocktailTileFromApi extends LightningElement {

    @api cocktail;
    Ing1;


    @api get cocktailIng(){
        return `{$cocktail.Ingredient1__c}`;
    }

}