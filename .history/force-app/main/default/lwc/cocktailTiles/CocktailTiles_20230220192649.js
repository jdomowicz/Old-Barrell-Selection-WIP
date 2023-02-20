import { LightningElement,api } from 'lwc';

export default class CocktailTiles extends LightningElement {

@api cocktaildata;


tileClickedHanlder(){
        console.log('event dispatched to parent');
    }

}