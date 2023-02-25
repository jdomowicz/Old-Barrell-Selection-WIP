import { LightningElement } from 'lwc';

export default class Cocktail_recipes_tab extends LightningElement {

    cocktailsData;
    recordId;
    searchTerm;
    searchType;

    handleCocktailTerm(event){

        this.searchTerm = event.detail;
        this.searchType = 

    }

    tileClickedHanlder(event){

        this.recordId = event.detail;
    }

}