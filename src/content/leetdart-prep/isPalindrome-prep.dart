// https://leetcode.com/problems/palindrome-number/description/
// https://gemini.google.com/app/6668d904eb5ba514

class Solution {
  bool isPalindrome(int x) {
    // some base checks
    // if x is less than 0 it can't be a palindrome
    if (x < 0) {
      return false;
    }

    // if x is below 10, a single digit, then it's automatically a palindrome
    if (x < 10) {
      return true;
    }

    // from here evaluate every other possible number
    // initilize variables
    // set reversed to 0. This variable will store the reversed string
    int reversed = 0;
    // save the current version of x as origial. We will use it to compare
    // after we reverse x
    int original = x;

    // are you ready for a math lesson?
    // we're going to modify x by taking numbers from the end, and adding them
    // to the beginning of reversed. When we're done, x will have no numbers
    // left, and so = 0. This will end our loop.
    while (x > 0) {
      // the first line divides our input number by 10, modulo. Modulo says,
      // give me just the remainder. For any number, divide by 10 and the
      // remainder is the last digit.
      // so this line stores the last digit of our input number as a variable.
      int digit = x % 10;
      // now we add that digit to reversed. Why do we multiply by 10? For any
      // digit alrady added to reversed, multiplying by 10 shifts them all 
      // to the left one spot. The first iteration reversed is 0, so the 10 is
      // cancelled. After that, whatever number is in reversed, first we 
      // multiply by 10, so we have our digit then 0, then we add our new
      // digit, so it takes the place of the 0.
      reversed = reversed * 10 + digit;
      // last we go back to x. We want to remove the last digit because we just
      // finished adding it to reversed. So we divide by 10, but this time we 
      // use integer divison and round down. This effectively cuts the last
      // digit from our number
      x ~/= 10;
      // in my opinion this is a clever, but not always useful way to reverse
      // a number. It's great that it works, and it's fast, so keep it in mind
      // if you ever have a number and you need to reverse it.
    }

    // last we compare the original string we stored to our reversd string.
    // if they are the same, then we have a palindrome and this expression 
    // returns true.
    return original == reversed;
  }
}

// key programmign concepts
//
// base checks and less than greater than
// variable declaration
// while loop
// math!
// modulo division to get the last digit
// 10 multiplication to shift digit place value
// integer divison to drop the last digit

void main() {
  Solution solution = Solution();

  // Test cases
  print('Test case 1: ${solution.isPalindrome(121)}'); // Expected: true
  print('Test case 2: ${solution.isPalindrome(-121)}'); // Expected: false
  print('Test case 3: ${solution.isPalindrome(10)}'); // Expected: false
  print('Test case 4: ${solution.isPalindrome(0)}'); // Expected: true
  print('Test case 5: ${solution.isPalindrome(123454321)}'); // Expected: true
  print('Test case 6: ${solution.isPalindrome(123456789)}'); // Expected: false
}