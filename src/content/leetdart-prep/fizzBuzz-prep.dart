// https://leetcode.com/problems/fizz-buzz/description/
// https://gemini.google.com/app/fd7c15e60a2b542e

// a great beginner problem for a "tower of if/else" statements
// you can also solve this with a switch(), but this method is preferred

// you're given a number, say 5. You have to think of it as an array with every
// number from 1 up to 5: [1, 2, 3, 4, 5]. Your answer will then process each
// number, and depending on the checks, keep the number in the array, or add
// one of the FizzBuzz words.

class Solution {
  List<String> fizzBuzz(int n) {
    // initialize our result array. We'll store our answer in here as we build
    // it, then return it at the end.
    List<String> result = [];
    // This is the for loop that builds our string array. It starts at 1, then 
    // runs until we reach n. Once we are done we will have added n items to our
    // results array.
    for (int i = 1; i <= n; i++) {
      // use modulo divison. If the remainder is 0, then the input number IS
      // divisible by 3 or 5.
      if (i % 3 == 0 && i % 5 == 0) {
        result.add("FizzBuzz");
      // the "else if" statements work in order. If one fails, you move on to
      // the next.
      // This check asks specifically, "In the input ONLY divisible by 3"?
      } else if (i % 3 == 0) {
        result.add("Fizz");
      // as as above, but just for 5
      } else if (i % 5 == 0) {
        result.add("Buzz");
      // last, if all other checks fail, add the string version of this integer
      // to our result array.
      } else {
        result.add(i.toString());
      }
    }
    return result;
  }
}

// key programmign concepts
//
// variable initilization
// for loop and iterating for a period of rounds
// if / else loops
// modulo division to check divisibility
// integer to string

void main() {
  Solution solution = Solution();

  // Test cases
  List<int> testInputs = [3, 5, 15];
  List<List<String>> expectedOutputs = [
    ["1", "2", "Fizz"],
    ["1", "2", "Fizz", "4", "Buzz"],
    [
      "1",
      "2",
      "Fizz",
      "4",
      "Buzz",
      "Fizz",
      "7",
      "8",
      "Fizz",
      "Buzz",
      "11",
      "Fizz",
      "13",
      "14",
      "FizzBuzz"
    ]
  ];

  for (int i = 0; i < testInputs.length; i++) {
    List<String> result = solution.fizzBuzz(testInputs[i]);
    print("Input: ${testInputs[i]}");
    print("Expected: ${expectedOutputs[i]}");
    print("Result: $result");
    if (result.toString() == expectedOutputs[i].toString()) {
      print("Test Passed");
    } else {
      print("Test Failed");
    }
    print("---");
  }

  //Additional test cases
  List<int> additionalInputs = [1,0,16];
  List<List<String>> additionalExpectedOutputs = [
    ["1"],
    [],
    ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz","16"]
  ];

  for (int i = 0; i < additionalInputs.length; i++) {
    List<String> result = solution.fizzBuzz(additionalInputs[i]);
    print("Input: ${additionalInputs[i]}");
    print("Expected: ${additionalExpectedOutputs[i]}");
    print("Result: $result");
        if (result.toString() == additionalExpectedOutputs[i].toString()) {
      print("Test Passed");
    } else {
      print("Test Failed");
    }
    print("---");
  }

}