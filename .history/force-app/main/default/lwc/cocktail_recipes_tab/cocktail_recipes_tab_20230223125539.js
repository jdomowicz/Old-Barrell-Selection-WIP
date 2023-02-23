import { LightningElement } from 'lwc';

export default class Cocktail_recipes_tab extends LightningElement {

    cocktailsData;
    recordId;
    searchTerm;
    searchType;

    handleSearchTerm(event){

        this.searchTerm = event.detail;

    }

    tileClickedHanlder(event){

        this.recordId = event.detail;
    }

}