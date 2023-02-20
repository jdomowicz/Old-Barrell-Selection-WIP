import { LightningElement,wire } from 'lwc';
import getCocktails from '@salesforce/apex/CocktailLWCHandler.getExisitngCocktails';

export default class Cocktail_recipes_filter extends LightningElement {

    SearchType = 'Name';
    SearchTerm = '';
    cocktails;
    error;


            get SearchCoctailOptions() {
        return [
            { label: 'Ingredient', value: 'Ingredient' },
            { label: 'Cocktail Name', value: 'Name' },
        ];
    }

    handleSearchTypeChange(event){
        this.SearchType = event.detail.value;
    }

    @wire (getCocktails { wrapper: '$parameterObject' })
     wiredCoctails({ error, data }) {
        if (data) {
            this.cocktails = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.cocktails = undefined;
        }
    }

    }

