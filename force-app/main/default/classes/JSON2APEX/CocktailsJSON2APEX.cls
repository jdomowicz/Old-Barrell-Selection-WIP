//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//

public class CocktailsJSON2APEX {

	public List<Drink> drinks;

    public class Drink {
		public String idDrink;
		public String strDrink;
		public String strCategory;
		public String strIBA;
		public String strAlcoholic;
		public String strGlass;
		public String strInstructions;
		public String strDrinkThumb;
		public String strIngredient1;
		public String strIngredient2;
		public String strIngredient3;
		public String strIngredient4;
		public String strIngredient5;
		public String strMeasure1;
		public String strMeasure2;
		public String strMeasure3;
		public String strMeasure4;
		public String strMeasure5;
		public String strImageSource;
	}

	public static CocktailsJSON2APEX parse(String json) {
		return (CocktailsJSON2APEX) System.JSON.deserialize(json, CocktailsJSON2APEX.class);
	}
}