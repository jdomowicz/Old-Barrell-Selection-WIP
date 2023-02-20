import { LightningElement } from 'lwc';

export default class Cocktail_recipes_tab extends LightningElement {

    cocktailsData;
   contacts = [
        {
            Id: 1,
            Name: 'Amy Taylor',
            Title: 'VP of Engineering',
        },
        {
            Id: 2,
            Name: 'Michael Jones',
            Title: 'VP of Sales',
        },
        {
            Id: 3,
            Name: 'Jennifer Wu',
            Title: 'CEO',
        },
    ];

    handleCocktailsData(event){

        this.cocktailsData = event.detail;
        console.log( 'data in parent component is');
        console.log(this.cocktailsData);

    }

}