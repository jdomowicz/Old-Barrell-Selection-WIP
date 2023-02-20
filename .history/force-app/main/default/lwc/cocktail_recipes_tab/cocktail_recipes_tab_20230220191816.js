import { LightningElement } from 'lwc';

export default class Cocktail_recipes_tab extends LightningElement {

    cocktailsData;

    handleCocktailsData(event){

        this.cocktailsData = event.detail;
        console.log( 'data in parent component is');
        console.log(this.cocktailsData);

    }

    tileClickedHanlder(){
        console.log('event dispatched to parent');
    }

}