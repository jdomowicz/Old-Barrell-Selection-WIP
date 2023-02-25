import { LightningElement } from 'lwc';

export default class Cocktail_recipes_tab extends LightningElement {

    cocktailsData;
    recordId;
    searchTerm;

    handleCocktailsData(event){

        this.searchTerm = event.detail;
        console.log( 'data in parent component is');
        console.log(this.cocktailsData);

    }

    tileClickedHanlder(event){

        this.recordId = event.detail;
    }

}