// https://leetcode.com/problems/two-sum/description/
// somewhere in here is Gem's reponse
// https://gemini.google.com/app/89912a907eb908fc

class Solution {
    List<int> twoSum(List<int> nums, int target) {
      Map<int, int> numMap = {};
      for (int i = 0; i < nums.length; i++) {
        int complement = target - nums[i];
        if (numMap.containsKey(complement)) {
          return [numMap[complement]!, i];
        }
        numMap[nums[i]] = i;
      }
      return []; // No solution found
    }
}

// key programming concepts in this codeblock
//
// basic function outline
// maps (initializing with type, checking a key, accessing a value)
// for loop (iterating through each item in a loop)
// variable declaration
// basic math

// let's think of some mini lessons

void main() {
  Solution solution = Solution();

  // Test Case 1
  List<int> nums1 = [2, 7, 11, 15];
  int target1 = 9;
  List<int> result1 = solution.twoSum(nums1, target1);
  print("Test Case 1: Input: $nums1, Target: $target1, Result: $result1");
  assert(result1.toString() == "[0, 1]");

  // Test Case 2
  List<int> nums2 = [3, 2, 4];
  int target2 = 6;
  List<int> result2 = solution.twoSum(nums2, target2);
  print("Test Case 2: Input: $nums2, Target: $target2, Result: $result2");
  assert(result2.toString() == "[1, 2]");

  //Test Case 3
  List<int> nums3 = [3,3];
  int target3 = 6;
  List<int> result3 = solution.twoSum(nums3, target3);
  print("Test Case 3: Input: $nums3, Target: $target3, Result: $result3");
  assert(result3.toString() == "[0, 1]");

  print("All tests passed!");
}