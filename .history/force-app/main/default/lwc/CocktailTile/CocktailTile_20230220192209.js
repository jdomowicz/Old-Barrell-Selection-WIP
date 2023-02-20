import { LightningElement,api } from 'lwc';

export default class CocktailTile extends LightningElement {


    @api cocktail;
    cocktailId;


    tileClick(){

        console.log(this.cocktail.Id);

        const event = new CustomEvent('tileclicked',{detail:this.cocktail.Id}, {
        bubbles: true,
        composed: true
    });
    this.dispatchEvent(event);

    console.log(this.cocktail.Id);

    }



}