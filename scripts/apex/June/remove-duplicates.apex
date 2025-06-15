/*
Remove Duplicates - 06/13/25 - Easy - 10pts

Write a method that removes duplicate String values from a List while preserving the original order of first occurrences. 
The method should return a new List with unique values only.

Examples:
Input: ['apple', 'banana', 'apple', 'orange', 'banana']
Output: ['apple', 'banana', 'orange']
Explanation: Duplicates removed, first occurrence kept

Input: ['hello', 'world', 'hello']
Output: ['hello', 'world']
Explanation: Second 'hello' is removed

Input: ['a', 'b', 'c']
Output: ['a', 'b', 'c']
Explanation: No duplicates, list unchanged

Input: []
Output: []
Explanation: Empty list remains empty
*/


public static List<String> removeDuplicates(List<String> items) {
	// Write your code here to remove duplicates while preserving order
	System.debug('Debug: Removing duplicates from list: ' + items);

	if (items == null) {
		return new List<String>();
	} else if (items.isEmpty()) {
		return new List<String>();
	}

	List<String> noDupList = new List<String>();
	Set<String> tempSet = new Set<String>();
	Boolean result = false;

	result = tempSet.addAll(items);

	for (String item : items) {		
		if (tempSet.contains(item) && !noDupList.contains(item)) {
			noDupList.add(item);
		}
	}

	return noDupList;
}


// Execute Anonymous Apex
List<String> items = new List<String>{'apple', 'banana', 'apple', 'orange', 'banana'};
System.debug('removeDuplicates() >>> ' + removeDuplicates(items));

items = new List<String>{'hello', 'world', 'hello'};
System.debug('removeDuplicates() >>> ' + removeDuplicates(items));

items = new List<String>{'a', 'b', 'c'};
System.debug('removeDuplicates() >>> ' + removeDuplicates(items));

items = new List<String>{};
System.debug('removeDuplicates() >>> ' + removeDuplicates(items));