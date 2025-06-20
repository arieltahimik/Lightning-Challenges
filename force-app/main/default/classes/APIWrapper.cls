public class APIWrapper {
	
	private String baseUrl;
	private Integer timeout;
	
	public APIWrapper(String baseUrl) {
		// Initialize the wrapper with base URL and default timeout
		System.debug('Debug: Initializing APIWrapper with baseUrl: ' + baseUrl);
		// TODO: Set this.baseUrl and this.timeout (default 30000ms)
		// Placeholder implementation - should properly initialize fields
        this.baseUrl = baseUrl;
        this.timeout = 30000;
	}
	
	public Map<String, Object> get(String endpoint) {
		// Implement GET request
		System.debug('Debug: Making GET request to endpoint: ' + endpoint);

        Map<String, Object> result = new Map<String, Object>();
        String body = '';

        HttpResponse response = makeRequest('GET', endpoint, body);
        if (response.getStatusCode() >= 200 && response.getStatusCode() < 300) {
            result = parseResponse(response);
        }
        
		return result; // TODO: Implement actual GET request
	}
	
	public Map<String, Object> post(String endpoint, String jsonBody) {
		// Implement POST request with JSON body
		System.debug('Debug: Making POST request to endpoint: ' + endpoint);

        Map<String, Object> result = new Map<String, Object>();        

        HttpResponse response = makeRequest('POST', endpoint, jsonBody);
        if (response.getStatusCode() >= 200 && response.getStatusCode() < 300) {
            result = parseResponse(response);
        }
        
		return result; // TODO: Implement actual POST request
	}
	
	public Map<String, Object> put(String endpoint, String jsonBody) {
		// Implement PUT request with JSON body
		System.debug('Debug: Making PUT request to endpoint: ' + endpoint);

        Map<String, Object> result = new Map<String, Object>();

		HttpResponse response = makeRequest('PUT', endpoint, jsonBody);
		
        if (response.getStatusCode() >= 200 && response.getStatusCode() < 300) {
            result = parseResponse(response);
        }
        
		return result; // TODO: Implement actual PUT request
	}
	
	public Map<String, Object> deleteMethod(String endpoint) {
		// Implement DELETE request
		System.debug('Debug: Making DELETE request to endpoint: ' + endpoint);

        Map<String, Object> result = new Map<String, Object>();
		String body = '';

		HttpResponse response = makeRequest('DELETE', endpoint, body);
		
        if (response.getStatusCode() >= 200 && response.getStatusCode() < 300) {
            result = parseResponse(response);
        }
        
		return result; // TODO: Implement actual DELETE request
	}
	
	// Helper method to make the actual HTTP request
	private HttpResponse makeRequest(String method, String endpoint, String body) {
		// TODO: Implement HTTP request logic
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(this.baseUrl + endpoint);
        request.setMethod(method);
		request.setTimeout(this.timeout);    // added

		// POST
		if (method == 'POST' || method == 'PUT' || method == 'DELETE') {
			request.setHeader('Content-Type', 'application/json');
			request.setBody(body);
		}

		try {
			HttpResponse response = http.send(request);
			Integer code = response.getStatusCode();

			System.debug(method.toUpperCase() + ' getStatusCode() >>> ' + code);

			if (code >= 200 && code < 300) {
				return response;
			} else {
				throw new CalloutException('Error code: ' + code + '\tResponse Body: ' + response.getBody());
			}			
		} catch (Exception e) {
			System.debug('Exception message: ' + e.getMessage());
			throw e;
		}
		
	}
	
	// Helper method to parse JSON response
	private Map<String, Object> parseResponse(HttpResponse response) {
		// TODO: Parse JSON response
        Object parsed = JSON.deserializeUntyped(response.getBody());
		return (Map<String, Object>) parsed;
	}
	
	// Getter for baseUrl to test initialization
	public String getBaseUrl() {
		return this.baseUrl;
	}
	
	// Getter for timeout to test initialization
	public Integer getTimeout() {
		return this.timeout;
	}
}
