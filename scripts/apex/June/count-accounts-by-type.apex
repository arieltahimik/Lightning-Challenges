/*
Count Accounts by Type - 06/09/25 - Easy - 10pts

NOTE: This question runs in a pre-configured Salesforce environment - no personal connection required.

Write a method that uses SOQL to count the number of Account records for a given Type (e.g., 'Customer' or 'Prospect'). 
The method should return the count as an Integer.

Examples:
Input: accountType = 'Customer'
Output: 24
Explanation: There are 24 accounts with Type = 'Customer'

Input: accountType = 'Prospect'  
Output: 6
Explanation: There are 6 accounts with Type = 'Prospect'

Input: accountType = 'Partner'
Output: 0
Explanation: No accounts have Type = 'Partner'
*/

public static Integer countAccountsByType(String accountType) {
    // Write your SOQL query here to count accounts by type
    System.debug('Debug: Counting accounts of type: ' + accountType);
    List<Account> accs = [
        SELECT Type 
        FROM Account 
        WHERE Type = :accountType
    ];
    return accs.size(); // Replace with your implementation
}


// Execute Anonymous Apex
String accountType = 'Prospect';
System.debug(countAccountsByType(accountType));