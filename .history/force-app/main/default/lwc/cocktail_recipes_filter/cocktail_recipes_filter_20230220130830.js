import { LightningElement } from 'lwc';

export default class Cocktail_recipes_filter extends LightningElement {

    SearchType = 'Ingredient';

    value={SearchType}
            placeholder="Select Search Type"
            options={SearchOptions}
            onchange={handleSearchTypeChange}

            get SearchCoctailOptions() {
        return [
            { label: 'New', SearchType: 'new' },
            { label: 'In Progress', value: 'inProgress' },
            { label: 'Finished', value: 'finished' },
        ];
    }

}