/*
Check Country Landlocked - 06/04/25 - Easy - 10pts

Fetch a country's landlocked status from the REST Countries API by searching for the country name and extracting the 
landlocked field from the response. Use the endpoint: https://restcountries.com/v3.1/name/{countryName}

Examples:
Input: countryName = "Switzerland"
Output: true
Explanation: The API returns country data with landlocked field set to true

Input: countryName = "France"
Output: false
Explanation: The API returns country data with landlocked field set to false
*/

public static Boolean isCountryLandlocked(String countryName) {
	// Write your code here to fetch country landlocked status from REST Countries API
	// Use endpoint: https://restcountries.com/v3.1/name/{countryName} (GET method)
	// Parse the JSON response and return the landlocked field
	System.debug(
		'Debug: Making HTTP GET request to REST Countries API for country: ' + countryName
	);
	if (String.isBlank(countryName)) {
    return null;
  } else {
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint('https://restcountries.com/v3.1/name/' + countryName);
		request.setMethod('GET');
		HttpResponse response = http.send(request);
		
		if (response.getStatusCode() == 200) {
				List<Object> responseBody = (List<Object>) JSON.deserializeUntyped(response.getBody());
				Map<String, Object> countryInfo = (Map<String, Object>) responseBody[0];				
				Boolean landlocked = (Boolean) countryInfo.get('landlocked');            
				return landlocked;
		}
		return false;
    }
}


// Execute Anonymous Apex
String countryName = 'Switzerland';
System.debug('isCountryLandlocked >>> ' + isCountryLandlocked(countryName));

countryName = 'France';
System.debug('isCountryLandlocked >>> ' + isCountryLandlocked(countryName));