/*
 * REST API Wrapper Class - 06/15/25 - Hard - 20pts
 *
 * This file calls the actual APIWrapper or APIWrapper2 (cleaner code with error check) classes.
 * Sort of the 'Execute Anonymous Apex' side of code.

NOTE: This question runs in a pre-configured Salesforce environment - no personal connection required.

Create a comprehensive REST API wrapper class that can handle GET, POST, PUT, and DELETE requests to the DummyJSON API. 
The class should include proper error handling, timeout management, and response parsing.

Your class should have the following structure:

Constructor that accepts a base URL (use 'https://dummyjson.com')
Methods for each HTTP verb (get, post, put, delete)
Proper error handling and status code checking
JSON response parsing
Configurable timeout (default 30 seconds)
Examples:
APIWrapper api = new APIWrapper('https://dummyjson.com');

// GET request - fetch user by ID
Map<String, Object> user = api.get('/users/1');
// Returns: {"id": 1, "firstName": "Emily", "lastName": "Johnson", ...}

// GET request - search products
Map<String, Object> products = api.get('/products/search?q=phone');
// Returns: {"products": [...], "total": 4, "skip": 0, "limit": 30}

// POST request - add new product (simulation)
String newProduct = '{"title":"iPhone 9","description":"An apple mobile","price":549}';
Map<String, Object> result = api.post('/products/add', newProduct);

// PUT request - update product (simulation)
String updateData = '{"title":"iPhone X"}';
Map<String, Object> updated = api.put('/products/1', updateData);

// DELETE request - delete product (simulation)
Map<String, Object> deleted = api.deleteMethod('/products/1');
*/

//APIWrapper api = new APIWrapper('https://dummyjson.com');
APIWrapper2 api = new APIWrapper2('https://dummyjson.com');
System.debug('api >>> ' + api);
System.debug('api.getBaseUrl >>> ' + api.getBaseUrl());
System.debug('api.getTimeout >>> ' + api.getTimeout());
System.debug('\n');

// GET request - fetch user by ID
Map<String, Object> user = api.get('/users/1');
System.debug('user >>> ' + user);
System.debug('user.firstName >>> ' + user.get('firstName'));
System.debug('user.lastName  >>> ' + user.get('lastName'));
System.debug('\n');
// Returns: {"id": 1, "firstName": "Emily", "lastName": "Johnson", ...}

// GET request - search products
Map<String, Object> products = api.get('/products/search?q=phone');    // products Map from JSON string
List<Object> productList = (List<Object>) products.get('products');    // 'Products' is List of Objects
Map<String, Object> info = (Map<String, Object>) productList[0];       // Get first item (0) on the list
System.debug('product1 title  >>> ' + info.get('title'));              // Now I can get info on specific key/value
System.debug('products.total >>> ' + products.get('total'));
System.debug('products.skip  >>> ' + products.get('skip'));
System.debug('products.limit >>> ' + products.get('limit'));
System.debug('\n');
// Returns: {"products": [...], "total": 4, "skip": 0, "limit": 30}

// POST request - add new product (simulation)
String newProduct = '{"title":"iPhone 9","description":"An apple mobile","price":549}';
Map<String, Object> addedProduct = api.post('/products/add', newProduct);
System.debug('addedProduct >>> ' + addedProduct);
System.debug('id    >>> ' + addedProduct.get('id'));
System.debug('title >>> ' + addedProduct.get('title'));
System.debug('\n');

// PUT request - update product (simulation)
String updateData = '{"title":"iPhone X"}';
Map<String, Object> updated = api.put('/products/1', updateData);
System.debug('updated >>> ' + updated);
System.debug('id    >>> ' + updated.get('id'));
System.debug('title >>> ' + updated.get('title'));
System.debug('\n');

// GET request - fetch product by ID (Check product before deleting)
Map<String, Object> product = api.get('/products/1');
System.debug('product >>> ' + product);
System.debug('id        >>> ' + product.get('id'));
System.debug('title     >>> ' + product.get('title'));
System.debug('isDeleted >>> ' + product.get('isDeleted'));
System.debug('deletedOn >>> ' + product.get('deletedOn'));
System.debug('\n');

// DELETE request - delete product (simulation)
Map<String, Object> deleted = api.deleteMethod('/products/1');
System.debug('deleted >>> ' + deleted);
System.debug('id        >>> ' + deleted.get('id'));
System.debug('title     >>> ' + deleted.get('title'));
System.debug('isDeleted >>> ' + deleted.get('isDeleted'));
System.debug('deletedOn >>> ' + deleted.get('deletedOn'));
System.debug('\n');