/*
Find High-Revenue Customer Accounts - 06/18/25 - Easy - 10pts

NOTE: This question runs in a pre-configured Salesforce environment - no personal connection required.

Write a SOQL query to find accounts that are Customer accounts with an annual revenue greater than 1 million. 
Return the account ID, name, type, and annual revenue, ordered by annual revenue descending.

Examples:

Input: Database contains accounts with various types and revenue levels
Output: List of accounts with Id, Name, Type, AnnualRevenue where Type = 'Customer' and AnnualRevenue > 1000000, 
ordered by AnnualRevenue DESC
Explanation: Query returns customer accounts with high revenue in descending order

Input: No customer accounts meet the revenue criteria
Output: Empty list
Explanation: No customer accounts found with annual revenue above 1 million
*/


public static List<Account> getHighRevenueCustomerAccounts() {
    // Write your SOQL query here to find customer accounts with high revenue
    System.debug('Debug: Searching for customer accounts with revenue > 1 million');
    List<Account> accounts = [
        SELECT Id, Name, Type, AnnualRevenue
        FROM Account
        WHERE Type LIKE 'Customer%' AND AnnualRevenue > 1000000
        ORDER BY AnnualRevenue DESC
    ];
    return accounts;
}


// Anonymous Apex
List<Account> accounts = getHighRevenueCustomerAccounts();
for (Account account : accounts) {
    System.debug('Id             : ' + account.Id);
    System.debug('Name           : ' + account.Name);
    System.debug('Type           : ' + account.Type);
    System.debug('Annual Revenue : ' + account.AnnualRevenue);
}