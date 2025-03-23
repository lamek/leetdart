// https://leetcode.com/problems/valid-parentheses/
// https://gemini.google.com/app/f606668f92968250

class Solution {
  // check if the string is odd, if so, it can't be valid
  bool isValid(String s) {
    if (s.length % 2 != 0) {
      return false;
    }

    // define variables
    // the stack array will hold our results
    // the map will be used to validate during our loop
    final stack = [];
    final map = {
      ')': '(',
      '}': '{',
      ']': '[',
    };

    // iterate through each item in our array
    for (int i = 0; i < s.length; i++) {
      // begin our checks
      // check if the current element is a "closing" parenthes. If so, we need
      // to validate it.
      if (map.containsKey(s[i])) {
        // verify 2 things:
        // 1. the stack is not empty. If it is, skip to adding this element to
        // our map.
        // 2. check if the current element matches it's "sister" element from
        // our map
        if (stack.isNotEmpty && stack.last == map[s[i]]) {
          // if there's match, we can remove the the last element, and not
          // add the current one.
          stack.removeLast();
        } else {
          // only opening parenthese can get added to our stack. When a closed
          // parenthese is added, it should match with the last element. If not
          // then the string is invalid.
          return false;
        }
      } else {
        // we only get here if we have an opening parentheses. If so, add it to
        // the map.
        stack.add(s[i]);
      }
    }

    // this returns true if the stack is empty. The stack is empty if all the 
    // opening pairs added were able to be removed by trying to add their
    // sister element.
    // If we reach the end of our code and there are still elmetns in the list,
    // then the sting is invalid and this returns false.
    return stack.isEmpty;
  }
}

// key programming concepts
//
// True or false
// modulo division to determin odd or even
// Declaring variables (list and map)
// declariing (initializing?) a map with values
// for loop (iterating through every elemetn in a string)
// checking for a key in a map
// "builtin" list functions, isNotEmpty and isEmpty
// logic operators, && and ==
// accessing an element in a string
// "builtin" list methods removeLast and add
// if loops with else checks


void main() {
  final solution = Solution();

  // Test cases
  print('Test Case 1: "()" - ${solution.isValid("()") == true}');
  print('Test Case 2: "()[]{}" - ${solution.isValid("()[]{}") == true}');
  print('Test Case 3: "(]" - ${solution.isValid("(]") == false}');
  print('Test Case 4: "([)]" - ${solution.isValid("([)]") == false}');
  print('Test Case 5: "{[]}" - ${solution.isValid("{[]}") == true}');
  print('Test Case 6: "" - ${solution.isValid("") == true}');
  print('Test Case 7: "[" - ${solution.isValid("[") == false}');
  print('Test Case 8: "]" - ${solution.isValid("]") == false}');
  print('Test Case 9: "(((((((((())))))))))" - ${solution.isValid("(((((((((())))))))))") == true}');
  print('Test Case 10: "(((((((((()))))))))))]" - ${solution.isValid("(((((((((()))))))))))]") == false}');
}