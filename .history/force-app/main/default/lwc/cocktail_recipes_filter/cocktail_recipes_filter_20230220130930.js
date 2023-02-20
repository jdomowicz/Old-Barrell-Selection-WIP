import { LightningElement } from 'lwc';

export default class Cocktail_recipes_filter extends LightningElement {

    SearchType = 'Ingredient';

            

            get SearchCoctailOptions() {
        return [
            { label: 'Ingredient', SearchType: 'Ingredient' },
            { label: 'Cocktail Name', SearchType: 'Cocktail' },
        ];
    }

    handleSearchTypeChange(){
        this.value = event.detail.value;
    }

}