/*
Fetch User Age - 06/11/25 - Medium - 15pts

NOTE: This question runs in a pre-configured Salesforce environment - no personal connection required.

Write a method that makes an HTTP callout to fetch user data and return the user's age as an Integer.

You'll need to make a GET request to: https://dummyjson.com/users/{userId}

The API returns JSON in this format:
{
	"id": 1,
	"firstName": "Emily",
	"lastName": "Johnson",
	"age": 28,
	"email": "emily.johnson@x.dummyjson.com",
	"phone": "+81 965-431-3024",
	"username": "emilys",
	"birthDate": "1996-5-30"
}

Examples:
Input: userId = 1
Output: 28
Explanation: User with ID 1 has age 28

Input: userId = 5
Output: 30
Explanation: User with ID 5 has age 30

Input: userId = 999
Output: null
Explanation: User with ID 999 does not exist, method returns null
*/

public static Integer fetchUserAge(Integer userId) {
	// Write your code here to fetch user data and return the age
	System.debug(
		'Debug: Making HTTP GET request to DummyJSON API for user ID: ' + userId
	);

    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://dummyjson.com/users/' + userId);
    request.setMethod('GET');
    HttpResponse response = http.send(request);

    if (response.getStatusCode() == 200) {
        Map<String, Object> responseBody = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        // Integer age = (Integer) responseBody.get('age');
        // return age;
        // -OR-
        return (Integer) responseBody.get('age');
    } else {
        return 0;
    }
}


// Execute Anonymous Apex
Integer userId = 1;
System.debug('fetchUserAge(userId) >>> ' + fetchUserAge(userId));

userId = 5;
System.debug('fetchUserAge(userId) >>> ' + fetchUserAge(userId));

userId = 999;
System.debug('fetchUserAge(userId) >>> ' + fetchUserAge(userId));

userId = null;
System.debug('fetchUserAge(userId) >>> ' + fetchUserAge(userId));