/*
Count Countries by Region - 06/01/25 - Hard - 20pts

NOTE: This question runs in a pre-configured Salesforce environment - no personal connection required.

Fetch all countries in a specified region from the REST Countries API and return the total count of countries in that region.

Examples:

Input: region = "Europe"
Output: 53
Explanation: The API returns an array of all European countries and we count the total number

Input: region = "Asia"
Output: 50
Explanation: The API returns an array of all Asian countries and we count the total number
*/

public static Integer countCountriesByRegion(String region) {
	// Write your code here to count countries in a region from REST Countries API
	// Use endpoint: https://restcountries.com/v3.1/region/{region} (GET method)
	// Parse the JSON response and return the count of countries in the array
	System.debug('Debug: Making HTTP GET request to REST Countries API for region: ' + region);
	if (String.isEmpty(region)) {
		return 0;
	}

	Http http = new Http();
	HttpRequest request = new HttpRequest();
	request.setEndpoint('https://restcountries.com/v3.1/region/' + region);
	request.setMethod('GET');
	HttpResponse response = http.send(request);

	if (response.getStatusCode() == 200) {
		List<Object> responseBody = (List<Object>) JSON.deserializeUntyped(response.getBody());
		return responseBody.size();
	}
	return 0;
}
String region = 'Europe';
System.debug('countCountriesByRegion(region) >>> ' + countCountriesByRegion(region));

region = 'Asia';
System.debug('countCountriesByRegion(region) >>> ' + countCountriesByRegion(region));