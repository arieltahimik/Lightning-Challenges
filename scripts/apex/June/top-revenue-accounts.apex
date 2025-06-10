/*
Top Revenue Accounts - 06/08/25 - Medium - 15pts

NOTE: This question runs in a pre-configured Salesforce environment - no personal connection required.

Return the top 5 Account names sorted by Annual Revenue in descending order.

Examples:

Input: Query executed on org with accounts having revenues of 10M, 75M, 25M, 120M, 50M, 90M
Output: ['Mega Corp', 'Tech Giant', 'Big Industries', 'Large Company', 'Medium Business']
Explanation: Returns top 5 Account names ordered by AnnualRevenue DESC

Input: Query executed on org with only 3 accounts
Output: ['Company A', 'Company B', 'Company C']
Explanation: Returns all available accounts when fewer than 5 exist
*/

public static List<String> getTopRevenueAccounts() {
    // Write your SOQL query here to get top 5 Account names by revenue
    List<String> topAccounts = new List<String>();
    List<Account> accs = [
        SELECT Name 
        FROM Account 
        ORDER BY AnnualRevenue DESC
    ];

    Integer accsSize = accs.size();

    Integer maxSize = (accsSize <= 3) ? 3 : 5;

    Integer counter = 0;
    for (Account acc : accs) {
        topAccounts.add(acc.Name);
        counter++;
        if (counter == maxSize) {
            break;
        }
    }
    
    return topAccounts; // Replace with your SOQL query result
}


// Execute Anonymous Apex
System.debug('getTopRevenueAccounts() >>> ' + getTopRevenueAccounts());