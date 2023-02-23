import { LightningElement ,wire} from 'lwc';
import getCocktails from '@salesforce/apex/CocktailLWCHandler.getExisitngCocktails';

export default class Cocktail_recipes_tab extends LightningElement {

    cocktailsData;
    recordId;
    searchTerm = '';
    searchType = "Name";

    handleSearchTerm(event){

        this.searchTerm = event.detail;

    }
      handlesearchType(event){

        this.searchType = event.detail;

    }

    tileClickedHanlder(event){

        this.recordId = event.detail;
    }


    @wire (getCocktails, { SearchTerm: '$SearchTerm', SearchType: '$SearchType' })
     wiredCocktails({ error, data }) {
        if (data) {
            this.cocktails = data;
            this.error = undefined;
            this.handleCocktailData();
            console.log(data);
        } else if (error) {
            this.error = error;
            this.cocktails = undefined;
        }
    }

}