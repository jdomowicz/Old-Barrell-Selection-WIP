import { LightningElement,api } from 'lwc';

export default class CocktailTile extends LightningElement {


    @api cocktail;
    cocktailId;


    tileClick(){

        console.log();

        const cocktailClicked = new CustomEvent('cocktailClick',{detail:this.cocktail.Id}, {
        bubbles: true ,
        composed: true
    });
    this.dispatchEvent(cocktailClicked);
    }



}