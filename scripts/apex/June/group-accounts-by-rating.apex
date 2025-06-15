/*
Group Accounts by Rating - 06/14/25 - Medium - 15pts

NOTE: This question runs in a pre-configured Salesforce environment - no personal connection required.

Write a method that uses SOQL to group Account records by their Rating and return a Map 
where the key is the Rating and the value is a List of Account records with that rating.

Examples:
Input: Database with accounts having different ratings
Output: Map<String, List<Account>>
{
  'Hot' => [Account1, Account2, Account3],
  'Warm' => [Account4, Account5],
  'Cold' => [Account6]
}

Example Processing:
- Accounts with Rating = 'Hot': 15 accounts
- Accounts with Rating = 'Warm': 11 accounts  
- Accounts with Rating = 'Cold': 4 accounts
- Accounts with Rating = null: grouped under null key
*/

public static Map<String, List<Account>> groupAccountsByRating() {
	// Write your SOQL query and grouping logic here
	System.debug('Debug: Grouping accounts by rating');

    // Get all accounts and their rating
    List<Account> accounts = [
        SELECT Rating, Name 
        FROM Account
        ORDER BY Rating, Name
    ];

    Map<String, List<Account>> accountsByRating = new Map<String, List<Account>>();

    // Loop thru all accounts
    for (Account acc : accounts) {
        String key = acc.Rating;
        
        // Check if Map contains Rating, create if not
        if (!accountsByRating.containsKey(key)) {
            accountsByRating.put(key, new List<Account>());
        }

        // then, add Name to the Map
        accountsByRating.get(key).add(acc);

    }
    
    return accountsByRating;
}


// Execute Anonymous Apex
Map<String, List<Account>> result = groupAccountsByRating();
System.debug('RESULT >>>' + result);

for (String key : result.keySet()) {
    List<Account> accounts = (List<Account>) result.get(key);
    System.debug('👉👉👉 ' + accounts);
    for (Account acc : accounts) {
        System.debug(acc.Rating + ': ' + '\tName:' + acc.Name);
    }
    
}
