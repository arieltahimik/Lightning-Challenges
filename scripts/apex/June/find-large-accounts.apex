/*
Find Large Accounts - 06/07/25 - Easy - 10pts

NOTE: This question runs in a pre-configured Salesforce environment - no personal connection required.

Return the names of all Accounts with Annual Revenue greater than 50 million dollars.

Examples:
Input: Query executed on org with accounts having revenues of 25M, 75M, and 120M
Output: ['Big Corp', 'Mega Industries']
Explanation: Returns Account names where AnnualRevenue > 50000000

Input: Query executed on org where all accounts have revenue under 50M
Output: []
Explanation: Returns empty list when no accounts meet the criteria
*/

public static List<String> getLargeAccountNames() {
    // Write your SOQL query here to get Account names with revenue > 50 million
    List<String> largeAccounts = new List<String>();

    List<Account> accs = [
        SELECT Name, AnnualRevenue 
        FROM Account
        WHERE AnnualRevenue > 50000000
    ];

    for (Account acc : accs) {
        largeAccounts.add(acc.Name);
    }
    return largeAccounts; // Replace with your SOQL query result
}


// Execute Anonymous Apex
System.debug('getLargeAccountNames() >>' + getLargeAccountNames());