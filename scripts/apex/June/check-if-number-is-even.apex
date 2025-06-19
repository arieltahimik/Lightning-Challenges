/*
Check if Number is Even - 06/19/25 - Easy - 10pts

Determine if an integer is even or odd. 
Return true if the number is even, false if odd. 
Return null if the input is null.

Examples:

Input: number = 4
Output: true
Explanation: 4 is divisible by 2, so it's even

Input: number = 7
Output: false
Explanation: 7 is not divisible by 2, so it's odd

Input: number = null
Output: null
Explanation: Null input returns null
*/


public static Boolean isEvenNumber(Integer num) {
    // Write your code here to check if number is even
    System.debug('Debug: Checking if number is even: ' + num);
    if (num == null) {
        return null;
    }
    return (Math.mod(num, 2) == 0) ? true : false;
}


// Execute Anonymous Apex
Integer num = 4;
System.debug('isEvenNumber(' + num + ') >>> ' + isEvenNumber(num));

num = 7;
System.debug('isEvenNumber(' + num + ') >>> ' + isEvenNumber(num));

num = null;
System.debug('isEvenNumber(' + num + ') >>> ' + isEvenNumber(num));