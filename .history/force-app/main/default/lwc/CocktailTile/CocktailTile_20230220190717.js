import { LightningElement,api } from 'lwc';

export default class CocktailTile extends LightningElement {


    @api cocktail;
    cocktailId;


    showCocktailDetails(event){


        const cocktailClicked = new CustomEvent('cocktailClick', {
        bubbles: true ,
        composed: true
    });
    this.dispatchEvent(cocktailClicked);
    }



}