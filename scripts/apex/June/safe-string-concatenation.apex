/*
Safe String Concatenation - 06/16/25 - Easy - 10pts

Concatenate two strings with a space in between. If either string is null, treat it as an empty string.

Examples:
Input: first = 'Hello', second = 'World'
Output: 'Hello World'
Explanation: Both strings are concatenated with a space

Input: first = null, second = 'World'
Output: ' World'
Explanation: Null first string treated as empty, space added before second string

Input: first = 'Hello', second = null
Output: 'Hello '
Explanation: Null second string treated as empty, space added after first string
*/


public static String safeStringConcat(String first, String second) {
    // Write your code here to safely concatenate two strings with a space
    System.debug('Debug: Concatenating strings: ' + first + ' and ' + second);

    if (first == null) {
        first = '';
    } 
    if (second == null) {
        second = '';
    }

    String newString = first.trim() + ' ' + second.trim();

    return newString;
}


// Execute Anonymous Apex
String first = 'Hello', second = 'World';
System.debug('Output >>> '  + '\'' + safeStringConcat(first, second) + '\'');    // Output: 'Hello World'
System.debug('Explanation: Both strings are concatenated with a space\n');

first = null;
second = 'World';
System.debug('Output >>> ' + '\'' + safeStringConcat(first, second) + '\'');    // Output: ' World'
System.debug('Explanation: Null first string treated as empty, space added before second string\n');

first = 'Hello';
second = null;
System.debug('Output >>> ' + '\'' + safeStringConcat(first, second) + '\'');    // Output: 'Hello '
System.debug('Explanation: Null second string treated as empty, space added after first string\n');
