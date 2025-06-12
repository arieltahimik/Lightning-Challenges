/*
Get Recipe Details - 05/30/25 - Easy - 10pts
NOTE: This question runs in a pre-configured Salesforce environment - no personal connection required.

Fetch a specific recipe from the DummyJSON API recipes endpoint and extract the cooking time in minutes.

Examples:
Input: No input required
Output: 30
Explanation: The API returns a recipe object with a 'cookTimeMinutes' field
*/

public static Integer getRecipeDetails() {
	// Write your code here to fetch recipe from https://dummyjson.com/recipes/1
	// Parse the JSON response and return the cookTimeMinutes field
	System.debug('Debug: Making HTTP request to DummyJSON recipes endpoint');
	
	Http http = new Http();
	HttpRequest request = new HttpRequest();

	request.setEndpoint('https://dummyjson.com/recipes/1');
	request.setMethod('GET');

	HttpResponse response = http.send(request);

	if (response.getStatusCode() == 200) {
		Map<String,Object> responseBody = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
		Integer cookingTimeInMinutes = (Integer) responseBody.get('cookTimeMinutes');
		return cookingTimeInMinutes;
	} else {
		return 0;
	}
}


// Execute Anonymous Apex
System.debug('getRecipeDetails() >>> ' + getRecipeDetails());