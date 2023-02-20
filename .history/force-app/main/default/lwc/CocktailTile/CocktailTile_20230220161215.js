import { LightningElement,api } from 'lwc';

export default class CocktailTile extends LightningElement {

    @api data;

    console.log(data)
}