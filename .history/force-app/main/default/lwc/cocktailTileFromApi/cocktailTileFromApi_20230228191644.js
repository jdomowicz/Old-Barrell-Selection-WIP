import { LightningElement,api } from 'lwc';

export default class CocktailTileFromApi extends LightningElement {

    @api cocktail;
    Ing1;


    get cocktailIng(){
        return `— ${this.cocktail.Ingredient1__c}`;
    }
    get cocktailIng2(){
        return `— ${this.cocktail.Ingredient2__c}`;
    }

}