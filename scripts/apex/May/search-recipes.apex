/*
Search Recipes - 05/29/25 - Medium - 15pts

NOTE: This question runs in a pre-configured Salesforce environment - no personal connection required.

Search for recipes containing a specific ingredient using the DummyJSON API and return the number of recipes found that contain the ingredient.

Examples:

Input: ingredient = "chicken"
Output: 5
Explanation: The API returns recipes that match the search, count how many contain the ingredient

Input: ingredient = "chocolate"
Output: 3
Explanation: Different ingredients will return different numbers of matching recipes
*/

public static Integer searchRecipes(String ingredient) {
	// Write your code here to search recipes by ingredient
	// Use endpoint: https://dummyjson.com/recipes/search?q={ingredient}
	// Parse the JSON response and return the number of recipes found
	System.debug('Debug: Making HTTP request to DummyJSON recipes search endpoint for ingredient: ' + ingredient);

	if (String.isEmpty(ingredient)) return 0;

	Http http = new Http();
    HttpRequest request = new HttpRequest();
	request.setEndpoint('https://dummyjson.com/recipes/search?q=' + ingredient);
    request.setMethod('GET');
	HttpResponse response = http.send(request);

	if (response.getStatusCode() == 200) {
		Map<String, Object> responseBody = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
		Integer total = (Integer) responseBody.get('total');
		return total;
	}
	return 0;
}


// Test run. Output changed, could be that the endpoint was updated?!!!
String ingredient = 'chicken';
System.debug('searchRecipes >>> ' + searchRecipes(ingredient));    // 8, not 5

ingredient = 'chocolate';
System.debug('searchRecipes >>> ' + searchRecipes(ingredient));    // 2, not 3