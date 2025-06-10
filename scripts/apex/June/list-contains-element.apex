/* 
List Contains Element - 06/10/25

Write a method that checks if a given String element exists in a List of Strings. 
The method should return true if the element is found, false otherwise. The comparison should be case-sensitive.

Examples:
Input: items = ['apple', 'banana', 'orange'], element = 'banana'
Output: true
Explanation: 'banana' exists in the list

Input: items = ['car', 'bike', 'train'], element = 'plane'
Output: false
Explanation: 'plane' does not exist in the list

Input: items = ['Hello', 'World'], element = 'hello'
Output: false
Explanation: Case-sensitive comparison - 'hello' != 'Hello'

Input: items = [], element = 'test'
Output: false
Explanation: Empty list contains no elements
*/

public static Boolean listContains(List<String> items, String element) {
	// Write your code here to check if the list contains the element
	System.debug('Debug: Checking if element "' + element + '" exists in list: ' + items);
	
	if (items == null) {
		return false;
	}
	
	if (items.contains(element)) {
		return true;
	} else {
		return false;
	}
}

List<String> items = new List<String>{'apple', 'banana', 'orange'};
String element = 'banana';
System.debug(listContains(items, element));

items = new List<String>{'car', 'bike', 'train'};
element = 'plane';
System.debug(listContains(items, element));

// Case sensitive, "hello" != "Hello"
items = new List<String>{'Hello', 'World'};
element = 'hello';
System.debug(listContains(items, element));

// items = new List<String>();  //-OR-
items = new List<String>{};     // Empty list
element = 'test';
System.debug(listContains(items, element));