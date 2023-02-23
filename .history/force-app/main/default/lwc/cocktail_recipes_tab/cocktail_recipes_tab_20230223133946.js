import { LightningElement ,wire} from 'lwc';
import getCocktails from '@salesforce/apex/CocktailLWCHandler.getExisitngCocktails';

export default class Cocktail_recipes_tab extends LightningElement {

    cocktails;
    recordId;
    searchTerm = "";
    searchType = "Name";
    error;

    handleSearchTerm(event){

        this.searchTerm = event.detail;
    }
      handlesearchType(event){

        this.searchType = event.detail;

    }

    tileClickedHanlder(event){

        this.recordId = event.detail;
    }


    @wire (getCocktails, { SearchTerm: '$searchTerm', SearchType: '$searchType' })
     wiredCocktails({ error, data }) {
        if (data) {
            this.cocktails = data;
            this.error = undefined;
            console.log(this.cocktails);
        } else if (error) {
            this.error = error;
            this.cocktails = undefined;
        }
    }

}