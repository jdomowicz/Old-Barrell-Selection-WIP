import { LightningElement } from 'lwc';

export default class Cocktail_recipes_filter extends LightningElement {

    SearchType = 'Ingredient';


            get SearchCoctailOptions() {
        return [
            { label: 'Ingredient', value: 'Ingredient' },
            { label: 'Cocktail Name', SearchType: 'Cocktail' },
        ];
    }

    handleSearchTypeChange(event){
        this.SearchType = event.detail.value;
    }

}