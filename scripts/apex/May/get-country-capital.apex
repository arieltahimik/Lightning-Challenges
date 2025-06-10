/*
Get Country Capital - 05/31/25 - Hard - 20pts

NOTE: This question runs in a pre-configured Salesforce environment - no personal connection required.

Fetch a country's capital city from the REST Countries API by searching for the country name and extracting the capital field from the response.

Examples:

Input: countryName = "France"
Output: "Paris"
Explanation: The API returns country data with the capital field containing "Paris"

Input: countryName = "Japan"
Output: "Tokyo"
Explanation: The API returns country data with the capital field containing "Tokyo"
*/

public static String getCountryCapital(String countryName) {
	// Write your code here to fetch country capital from REST Countries API
	// Use endpoint: https://restcountries.com/v3.1/name/{countryName} (GET method)
	// Parse the JSON response and return the capital field (first element of array)
	System.debug('Debug: Making HTTP GET request to REST Countries API for country: ' + countryName);
	if (String.isEmpty(countryName)) return null;
	Http http = new Http();
	HttpRequest request = new HttpRequest();
	request.setEndpoint('https://restcountries.com/v3.1/name/' + countryName);
	request.setMethod('GET');
	HttpResponse response = http.send(request);
	if (response.getStatusCode() == 200) {
		List<Object> responseBody = (List<Object>) JSON.deserializeUntyped(response.getBody());
		// Get first country in array (index 0)
		Map<String, Object> country = (Map<String, Object>) responseBody[0];
		// Capital is an object (array)
		List<Object> capitalList = (List<Object>) country.get('capital');
		String capital = (String) capitalList[0];
		return capital;
	} else {
		return null;
	}
}


// Execute Anonymous Apex
String countryName = 'France';
System.debug('getCountryCapital(countryName) >>> ' + getCountryCapital(countryName));

countryName = 'Japan';
System.debug('getCountryCapital(countryName) >>> ' + getCountryCapital(countryName));