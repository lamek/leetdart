// https://leetcode.com/problems/maximum-subarray/description/
// https://gemini.google.com/app/ec1bb77b6dcf4fbf

// This problem benefits from some preamble. The leetcode version asks you to 
// "find the subarray with the largest sum", but a better setup would stay this:
// You have a long list of positive and negative numbers. You can add any
// continuous group of them together. The first 3. 5 numbers in the middle. Etc.
// Scan the entire array an find the subarray with the largest sum. It might be
// 2 numbers long (or only 1), or it might be longer.

// My note: this solution is unintuitive. I think it works like this. You start
// iterating through numbers in the array and summing them, storing the
// cumulative result. Only if you reach a number that, on its own, is larger
// than the current sum plus that number, do you update current max to equal
// that number. Essentially, at that point, you're starting over your sum.
// What's hidden to me is, how do you know that you can just forget all the
// previous numbers up to that point? I think it's because either they are
// negative, or they include a number that is so negative (such a large
// negative number), that keeping it in the running sum, or answer array, would
// lessen the total value more than just starting over. Clever

class Solution {
  int maxSubArray(List<int> nums) {
    // make an initial check if the input array is empty
    // if so, return 0
    if (nums.isEmpty) {
      return 0;
    }

    // these are our trackers. We keep the highest sum we have seen in max.
    // As we traverse the array, we keep a running max in current. After a
    // current max ends, we check the current against our stored max, and update
    // if the current is higher.
    int maxSoFar = nums[0];
    int currentMax = nums[0];

    // the now classic, iterate through each number in the array
    for (int i = 1; i < nums.length; i++) {
      // this is the heart of the algorithm right here. Let's break it down.
      // If the current number is higher than the current sum plus the current
      // number, then
      // set current max to the current number. This is a restart.
      // if not, then add the current number to current max.
      currentMax = nums[i] > currentMax + nums[i] ? nums[i] : currentMax + nums[i];
      // after each number in the array we evaluate, check what's bigger:
      // current max or max so far. Keep the higher value in maxsofar.
      maxSoFar = maxSoFar > currentMax ? maxSoFar : currentMax;
    }

    // After checking every number, return maxsofar
    return maxSoFar;
  }
}

// key programming concepts in this problem
//
// if loop
// builtin list method isEmpty (getters)
// initialize variables
// iterating through a list
// for loop 
// conditional operator (ternary operator) (if this, then that, otherwise the other thing)

void main() {
  Solution solution = Solution();

  // Test cases
  List<List<int>> testCases = [
    [-2, 1, -3, 4, -1, 2, 1, -5, 4],
    [1],
    [5, 4, -1, 7, 8],
    [-1],
    [-2,-1],
    [-2,1]
  ];

  List<int> expectedResults = [
    6,
    1,
    23,
    -1,
    -1,
    1
  ];

  for (int i = 0; i < testCases.length; i++) {
    int result = solution.maxSubArray(testCases[i]);
    print("Test Case ${i + 1}: Input: ${testCases[i]}, Output: $result, Expected: ${expectedResults[i]}");
    if (result == expectedResults[i]) {
      print("Test Case ${i + 1}: Passed");
    } else {
      print("Test Case ${i + 1}: Failed");
    }
  }
}