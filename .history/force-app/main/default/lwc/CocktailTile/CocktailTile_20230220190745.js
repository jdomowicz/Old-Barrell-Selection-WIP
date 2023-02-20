import { LightningElement,api } from 'lwc';

export default class CocktailTile extends LightningElement {


    @api cocktail;
    cocktailId;


    showCocktailDetails(){

        const cocktailClicked = new CustomEvent('cocktailClick',{detail:this.}, {
        bubbles: true ,
        composed: true
    });
    this.dispatchEvent(cocktailClicked);
    }



}