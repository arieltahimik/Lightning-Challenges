/*
Count Hot Accounts - 06/05/25 - Easy -10pts

NOTE: This question runs in a pre-configured Salesforce environment - no personal connection required.

Count the total number of Account records where the Rating field equals 'Hot'.

Examples:

Input: Query executed on org with 15 Hot accounts, 11 Warm accounts, 4 Cold accounts
Output: 15
Explanation: Returns count of accounts where Rating = 'Hot'
*/

public static Integer countHotAccounts() {
    // Write your SOQL query here to count Account records where Rating = 'Hot'
    List<Account> hotAccounts = [SELECT Id FROM Account WHERE Rating = 'Hot'];
    return hotAccounts.size(); // Replace with your SOQL query result
}

// Execute Anonymous Apex
System.debug('countHotAccounts() >>> ' + countHotAccounts());