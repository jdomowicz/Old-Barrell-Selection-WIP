import { LightningElement, wire } from "lwc";
import getCocktails from "@salesforce/apex/CocktailLWCHandler.getExisitngCocktails";

export default class Cocktail_recipes_tab extends LightningElement {
  showDetails = false;
  cocktails;
  recordId;
  searchTerm = "";
  searchType = "Name";
  error;
  tabSelected;

  handleSearchTerm(event) {
    this.searchTerm = event.detail;
  }
  handlesearchType(event) {
    this.searchType = event.detail;
  }

  tileClickedHanlder(event) {

    this.updateShowDetails(event.detail);

    this.recordId = event.detail;
  }

  handleActiveTab(event){

    console.log(event.target.);
    this.tabSelected = event.target;
    console.log(this.tabSelected);
  }

  @wire(getCocktails, { SearchTerm: "$searchTerm", SearchType: "$searchType" })
  wiredCocktails({ error, data }) {
    if (data) {
      this.cocktails = data;
      this.error = undefined;
    } else if (error) {
      this.error = error;
      this.cocktails = undefined;
    }
  }

  updateShowDetails(eventRecordId){

    if(eventRecordId == this.recordId && this.showDetails === true){

      this.showDetails = false;

    }
    else if(this.showDetails === false){

      this.showDetails = true;

    }
    else if(this.showDetails === true){

      this.showDetails = true;

    }
  }
}
