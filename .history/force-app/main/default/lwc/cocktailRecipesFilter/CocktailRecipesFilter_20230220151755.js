import { LightningElement,track } from 'lwc';
import getCocktails from '@salesforce/apex/CocktailLWCHandler.getExisitngCocktails';

export default class Cocktail_recipes_filter extends LightningElement {

    SearchType = 'Ingredient';
    SearchTerm = '';
    cocktails;
    error;


            get SearchCoctailOptions() {
        return [
            { label: 'Ingredient', value: 'Ingredient' },
            { label: 'Cocktail Name', value: 'Cocktail' },
        ];
    }

    handleSearchTypeChange(event){
        this.SearchType = event.detail.value;
    }

    handleLoadCocktails() {
        getCocktails({ searchTerm: this.SearchTerm,SearchType: this.SearchType})
            .then(result => {
                this.cocktails = result;
            })
            .catch(error => {
                this.error = error;
            });
    }

}