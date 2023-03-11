import { LightningElement,api } from 'lwc';

export default class CocktailTilesFromApi extends LightningElement {


@api cocktaildata;


connectedCallback(){

    console.log();

    console.log(this.cocktaildata);

}

}