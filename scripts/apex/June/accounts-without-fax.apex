/*
Accounts Without Fax - 06/12/25 - Easy - 10pts

NOTE: This question runs in a pre-configured Salesforce environment - no personal connection required.

Write a method that uses SOQL to find all Account records that do not have a Fax number. 
The method should return a List of Account records where the Fax field is either null or empty.

Examples:
Input: Database contains accounts with and without fax numbers
Output: List<Account> containing only accounts where Fax is null or empty
Explanation: Returns accounts that have no fax number specified

Example Accounts:
- TechFlow Solutions (Fax: null) - INCLUDED
- Global Manufacturing (Fax: '') - INCLUDED  
- Cloud Code Academy (Fax: '+1-555-0199') - EXCLUDED
*/

public static List<Account> getAccountsWithoutFax() {
	// Write your SOQL query here to find accounts without fax numbers
	System.debug('Debug: Searching for accounts without fax numbers');
    List<Account> accounts = [
        SELECT Name
        FROM   Account
        WHERE  Fax = NULL
    ];
	return accounts;
}

// Execute Anonymous Apex
System.debug('getAccountsWithoutFax() >>> ' + getAccountsWithoutFax());