/*
Calculate Age in Years - 06/17/25 - Easy - 10pts
Calculate a person's age in complete years from their birthdate. Return null if the birthdate is null or in the future.

Examples:

Input: birthdate = Date.newInstance(1990, 5, 15), today = Date.newInstance(2025, 6, 17)
Output: 35
Explanation: Person is 35 complete years old

Input: birthdate = Date.newInstance(2000, 12, 25), today = Date.newInstance(2025, 6, 17)
Output: 24
Explanation: Person hasn't reached their 25th birthday yet

Input: birthdate = null
Output: null
Explanation: Null birthdate returns null
*/


public static Integer calculateAgeInYears(Date birthdate) {
    // Write your code here to calculate age in complete years
    System.debug('Debug: Calculating age from birthdate: ' + birthdate);
    if (birthdate == null || birthdate > Date.today()) {
        return null;
    }    
    Integer age = Integer.valueOf((birthdate.monthsBetween(Date.today()) / 12));
    return age;
}


// Execute Anonymous Apex
Date birthdate = Date.newInstance(1990, 5, 15);
Date today = Date.newInstance(2025, 6, 17);
System.debug('Person is ' + calculateAgeInYears(birthdate) + ' complete years old\n');

birthdate = Date.newInstance(2000, 12, 25);
today = Date.newInstance(2025, 6, 17);
System.debug('Person is ' + calculateAgeInYears(birthdate) + ' complete years old');
System.debug('Person hasn\'t reached their 25th birthday yet\n');

birthdate = null;
System.debug('Person is ' + calculateAgeInYears(birthdate) + ' complete years old');
System.debug('Explanation: Null birthdate returns null\n');