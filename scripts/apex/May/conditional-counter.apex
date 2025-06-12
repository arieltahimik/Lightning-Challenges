/*
Conditional Counter - 05/17/25 - Medium - 15pts

Create a method that counts items in a list that meet one or more condition based on specified logic (AND or OR).
Your task is to implement a method that takes a list of integers, a set of condition, and a logic operator ('AND' or 'OR'), 
and returns the count of items satisfying those condition.

Input: 
  numbers = [10, 15, 8, 20, 25, 30]
  condition = [">5", "<25", "!=15"]
  logic = "AND"
Output: 3
Explanation: The numbers [8, 10, 20] satisfy ALL condition: greater than 5, less than 25, and not equal to 15

Input: 
  numbers = [10, 15, 8, 20, 25, 30]
  condition = [">25", "<10"]
  logic = "OR"
Output: 3
Explanation: The numbers [8, 25, 30] satisfy EITHER condition: either less than 10 (for 8) or greater than 25 (for 25 and 30

NOTE: Examples above are given. But I think output for example #2 should only include [8, 30] 
      and not 25 because 25 is not greater than 25 (25 > 25 = false). So, output should only be 2 and not 3.
*/


public Integer countItems(List<Integer> numbers, List<String> conditions, String logic) {
    // Your solution here
    //System.debug('Debug: Counting items with logic: ' + logic);

    if (numbers==null || conditions==null || logic==null) {
        return 0;
    }

    List<Integer> items = new List<Integer>();
    
    // Loop through the numbers
    for (Integer num : numbers) {

        Boolean result;
        logic = logic.toUppercase();

        if (logic == 'AND') {
            result = true;
            for (String con : conditions) {
                result = checkCondition(num, con);
                if (result == false) {
                    break;
                }
            }
            if (result == true) {
                items.add(num);
            }
        } else if (logic == 'OR') {
            result = false;
            for (String con : conditions) {
                result = checkCondition(num, con);
                if (result == true) {
                    break;
                }
            }
            if (result == true) {
                items.add(num);
            }
        } else {
            return 0;    // Invalid logic
        }            
    }

    System.debug('items >>> ' + items);
    return items.size(); // Replace with your implementation
}


// Helper method to check a condition
public static Boolean checkCondition(Integer num, String condition) {
    Integer value = 0;

    if(condition.startsWith('<=')) {
        value = Integer.valueOf(condition.substring(2));
        return num <= value;
    } else if(condition.startsWith('>=')) {
        value = Integer.valueOf(condition.substring(2));
        return num >= value;
    } else if(condition.startsWith('!=')) {
        value = Integer.valueOf(condition.substring(2));
        return num != value;
    } else if(condition.startsWith('==')) {
        value = Integer.valueOf(condition.substring(2));
        return num == value;
    } else if(condition.startsWith('<')) {
        value = Integer.valueOf(condition.substring(1));
        return num < value;
    } else if(condition.startsWith('>')) {
        value = Integer.valueOf(condition.substring(1));
        return num > value;
    }

    return false;
}



//List<Integer> numbers = new List<Integer>{10, 15, 8, 20, 25, 30};
//List<String> condition = new List<String>{'>5', '<25', '!=15'};
//String logic = 'AND';

List<Integer> numbers = new List<Integer>{10,15,8,20,25,30};
List<String> condition = new List<String>{'>25', '<10'};
String logic = 'OR';

// List<Integer> numbers = new List<Integer>{};
// List<String> condition = new List<String>{'>5', '<25'};
// String logic = 'AND';

// List<Integer> numbers = null;
// List<String> condition = new List<String>{'>5', '<25'};
// String logic = 'AND';

// List<Integer> numbers = new List<Integer>{10,15,20,25};
// List<String> condition = new List<String>{'>5'};
// String logic = 'AND';

// List<Integer> numbers = new List<Integer>{10,15,20,25};
// List<String> condition = new List<String>{'>100'};
// String logic = 'AND';

// List<Integer> numbers = new List<Integer>{10,15,8,20,25,30};
// List<String> condition = new List<String>{'>5','<25','!=15'};
// String logic = 'AND';


System.debug('countItems >>> ' + countItems(numbers, condition, logic));

