import { LightningElement,api } from 'lwc';

export default class CocktailTile extends LightningElement {


    @api cocktail;


    showCocktailDetails(){
        const buttonclicked = new CustomEvent('buttonclick', {
       { bubbles: true }
    });
    this.dispatchEvent(buttonclicked);
    }



}