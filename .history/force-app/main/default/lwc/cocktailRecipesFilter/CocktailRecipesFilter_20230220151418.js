import { LightningElement } from 'lwc';
import getCocktail from '@salesforce/apex/ContactController.getContactList';

export default class Cocktail_recipes_filter extends LightningElement {

    SearchType = 'Ingredient';


            get SearchCoctailOptions() {
        return [
            { label: 'Ingredient', value: 'Ingredient' },
            { label: 'Cocktail Name', value: 'Cocktail' },
        ];
    }

    handleSearchTypeChange(event){
        this.SearchType = event.detail.value;
    }

}