/*
Get Country Currency - 06/03/25 - Easy - 10pts

NOTE: This question runs in a pre-configured Salesforce environment - no personal connection required.

Fetch a country's currency name from the REST Countries API by searching for the country name and extracting the 
currency field from the response. Use the endpoint: https://restcountries.com/v3.1/name/{countryName}

Examples:

Input: countryName = "USA"
Output: "United States dollar"
Explanation: The API returns country data with currencies containing "United States dollar"

Input: countryName = "Japan"
Output: "Japanese yen"
Explanation: The API returns country data with currencies containing "Japanese yen"
*/


public static String getCountryCurrency(String countryName) {
	// Write your code here to fetch country currency from REST Countries API
	// Use endpoint: https://restcountries.com/v3.1/name/{countryName} (GET method)
	// Parse the JSON response and return the currency name from the currencies field
	System.debug(
		'Debug: Making HTTP GET request to REST Countries API for country: ' + countryName
	);
	
	if (String.isEmpty(countryName)) return null;

	Http http = new Http();
	HttpRequest request = new HttpRequest();
	request.setEndpoint('https://restcountries.com/v3.1/name/' + countryName);
	request.setMethod('GET');
	HttpResponse response = http.send(request);

	if (response.getStatusCode() == 200) {
		List<Object> responseBody = (List<Object>) JSON.deserializeUntyped(response.getBody());
		Map<String, Object> countryInfo = (Map<String, Object>) responseBody[0];
		Map<String, Object> currencies = (Map<String, Object>) countryInfo.get('currencies');
		for (String key : currencies.keySet()) {
			Map<String, Object> currencyCode = (Map<String, Object>) currencies.get(key);
			String currencyName = (String) currencyCode.get('name');
			return currencyName;
		}
	}
	return null;
}


// Execute Anonymous Apex
String countryName = 'USA';
System.debug('getCountryCurrency() >>> ' + getCountryCurrency(countryName));

countryName = 'Japan';
System.debug('getCountryCurrency() >>> ' + getCountryCurrency(countryName));