/*
List USA Accounts - 06/06/25 - Easy - 10pts

NOTE: This question runs in a pre-configured Salesforce environment - no personal connection required.

Return a list of Account names for all Accounts located in the USA.

Examples:
Input: Query executed on org with accounts in USA, Canada, and UK
Output: ['Tech Corp', 'Financial Solutions Inc', 'Healthcare Systems']
Explanation: Returns only Account names where BillingCountry = 'USA'

Input: Query executed on org with no USA accounts
Output: []
Explanation: Returns empty list when no accounts match the criteria
*/

public static List<String> getUsaAccountNames() {
    // Write your SOQL query here to get Account names from USA
    List<String> usaAccounts = new List<String>();
    List<Account> accs = [SELECT Name FROM Account WHERE BillingCountry = 'USA'];

    for (Account acc : accs) {
        usaAccounts.add(acc.Name);
    }
    return usaAccounts; // Replace with your SOQL query result

}

// Execute Anonymous Apex
System.debug('getUsaAccountNames() >>' + getUsaAccountNames());