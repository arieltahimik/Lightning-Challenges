public class APIWrapper2 {
    
    private String baseUrl;
    private Integer timeout;

    // Constructor with base URL and default timeout
    public APIWrapper2(String baseUrl) {
        System.debug('Debug: Initializing APIWrapper2 with baseUrl: ' + baseUrl);
        this.baseUrl = baseUrl;
        this.timeout = 30000; // default timeout 30 seconds
    }

    // GET request
    public Map<String, Object> get(String endpoint) {
        System.debug('Debug: Making GET request to endpoint: ' + endpoint);
        return sendAndParse('GET', endpoint, '');
    }

    // POST request with JSON string
    public Map<String, Object> post(String endpoint, String jsonBody) {
        System.debug('Debug: Making POST request to endpoint: ' + endpoint);
        return sendAndParse('POST', endpoint, jsonBody);
    }

    // PUT request with JSON string
    public Map<String, Object> put(String endpoint, String jsonBody) {
        System.debug('Debug: Making PUT request to endpoint: ' + endpoint);
        return sendAndParse('PUT', endpoint, jsonBody);
    }

    // DELETE request
    public Map<String, Object> deleteMethod(String endpoint) {
        System.debug('Debug: Making DELETE request to endpoint: ' + endpoint);
        return sendAndParse('DELETE', endpoint, '');
    }

    // Centralized HTTP request handler
    private Map<String, Object> sendAndParse(String method, String endpoint, String body) {
        Map<String, Object> result = new Map<String, Object>();

        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(this.baseUrl + endpoint);
            request.setMethod(method);
            request.setTimeout(this.timeout);

            if (method == 'POST' || method == 'PUT' || method == 'DELETE') {
                request.setHeader('Content-Type', 'application/json');
                request.setBody(body);
            }

            HttpResponse response = http.send(request);
            Integer statusCode = response.getStatusCode();

            System.debug('Response Status Code: ' + statusCode);
            //System.debug('Response Body: ' + response.getBody());

            if (statusCode >= 200 && statusCode < 300) {
                result = parseResponse(response);
            } else {
                throw new CalloutException('HTTP ' + method + ' failed: ' + statusCode + ' - ' + response.getBody());
            }
        } catch (Exception e) {
            System.debug('Error during HTTP ' + method + ': ' + e.getMessage());
            throw e;
        }

        return result;
    }

    // Parses the JSON body into a Map<String, Object>
    private Map<String, Object> parseResponse(HttpResponse response) {
        Object parsed = JSON.deserializeUntyped(response.getBody());
        return (Map<String, Object>) parsed;
    }

    // Getters for testing/debugging
    public String getBaseUrl() {
        return this.baseUrl;
    }

    public Integer getTimeout() {
        return this.timeout;
    }
}
