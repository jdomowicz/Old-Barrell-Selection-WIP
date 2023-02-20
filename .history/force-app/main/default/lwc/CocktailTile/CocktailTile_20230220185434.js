import { LightningElement,api } from 'lwc';

export default class CocktailTile extends LightningElement {


    @api cocktail;


    showCocktailDetails(){
        const cocktailClicked = new CustomEvent('buttonclick', {
        bubbles: true ,
        composed: true
    });
    this.dispatchEvent(cocktailClicked);
    }



}