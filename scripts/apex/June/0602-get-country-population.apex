/*
Get Country Population - 06/02/25 - Easy - 10pts

NOTE: This question runs in a pre-configured Salesforce environment - no personal connection required.

Fetch a country's population from the REST Countries API by searching for the country name and extracting the 
population field from the response. Use the endpoint: https://restcountries.com/v3.1/name/{countryName}

Examples:

Input: countryName = "Germany"
Output: 83240525
Explanation: The API returns country data with the population field containing 83240525

Input: countryName = "Monaco"
Output: 39244
Explanation: The API returns country data with the population field containing 39244
*/

public static Integer getCountryPopulation(String countryName) {
	// Write your code here to fetch country population from REST Countries API
	// Use endpoint: https://restcountries.com/v3.1/name/{countryName} (GET method)
	// Parse the JSON response and return the population field
	System.debug(
		'Debug: Making HTTP GET request to REST Countries API for country: ' + countryName
	);

	if (countryName == null) {
		return null;
	}

	if (String.isBlank(countryName)) {
    return 0;
  }

	Http http = new Http();
	HttpRequest request = new HttpRequest();
	request.setEndpoint('https://restcountries.com/v3.1/name/' + countryName);
	request.setMethod('GET');
	HttpResponse response = http.send(request);
	
	if (response.getStatusCode() == 200) {
		List<Object> responseBody = (List<Object>) JSON.deserializeUntyped(response.getBody());
		Map<String, Object> countryInfo = (Map<String, Object>) responseBody[0];
		Integer population = (Integer) countryInfo.get('population');
		return population;
	} else {
		return 0;
	}
}


// Execute Anonymous Apex
String countryName = 'Germany';
System.debug('getCountryPopulation() >>> ' + getCountryPopulation(countryName).format());

countryName = 'Monaco';
System.debug('getCountryPopulation() >>> ' + getCountryPopulation(countryName).format());