import { LightningElement } from 'lwc';
//import getCocktails from '@salesforce/apex/CocktailLWCHandler.getExisitngCocktails';

export default class Cocktail_recipes_filter extends LightningElement {

    SearchType = 'Name';
    SearchTerm = '';



            get SearchCoctailOptions() {
        return [
            { label: 'Ingredient', value: 'Ingredient' },
            { label: 'Cocktail Name', value: 'Name' },
        ];
    }

    handleSearchTypeChange(event){
        this.SearchType = event.detail.value;
      const selectedEvent  = new CustomEvent('cocktailsearchtype',{detail: this.SearchType});
      this.dispatchEvent(selectedEvent );
      console.log(event);
    }

    handleSearchTerm(event){
        this.SearchTerm = event.detail.value;
      event = this.dispatchEvent(new CustomEvent('cocktailsearchterm',{detail: this.SearchTerm}));
      console.log(event);

    }

    /*
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
    */

    /*
    handleCocktailData() {
    this.dispatchEvent(new CustomEvent('cocktails',{detail: this.cocktails}));
  }
  */

    }

